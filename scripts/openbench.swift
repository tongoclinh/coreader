// Measures how long an app takes to open a book, from the outside: records the main display with
// ScreenCaptureKit (60 fps, half resolution, grey), runs the launch command, and reports
//   first:    first frame where the app's window region differs from the pre-launch frame
//   complete: first frame after which the region never changes again ("visually complete")
// relative to the moment the command was started. The region is the union of the app's on-screen
// windows once capture ends. Prints one JSON object; writes the final region as a PNG.
//
// usage: openbench --owner <app name substring> --duration <s> --png <path> -- <command> [args...]
//        openbench --list      (names of apps with on-screen windows)
import CoreGraphics
import CoreMedia
import CoreVideo
import Foundation
import ImageIO
import ScreenCaptureKit
import UniformTypeIdentifiers

struct Frame { let t: Double; let px: [UInt8] }

final class Recorder: NSObject, SCStreamOutput, @unchecked Sendable {
    private let lock = NSLock()
    private(set) var frames: [Frame] = []
    private(set) var width = 0, height = 0

    func stream(_ stream: SCStream, didOutputSampleBuffer sb: CMSampleBuffer, of type: SCStreamOutputType) {
        guard type == .screen,
              let info = CMSampleBufferGetSampleAttachmentsArray(sb, createIfNecessary: false) as? [[SCStreamFrameInfo: Any]],
              let raw = info.first?[.status] as? Int, SCFrameStatus(rawValue: raw) == .complete,
              let pb = CMSampleBufferGetImageBuffer(sb) else { return }
        CVPixelBufferLockBaseAddress(pb, .readOnly)
        defer { CVPixelBufferUnlockBaseAddress(pb, .readOnly) }
        // 420 bi-planar full range: plane 0 is luma, i.e. already grey.
        let w = CVPixelBufferGetWidthOfPlane(pb, 0), h = CVPixelBufferGetHeightOfPlane(pb, 0)
        let bpr = CVPixelBufferGetBytesPerRowOfPlane(pb, 0)
        let base = CVPixelBufferGetBaseAddressOfPlane(pb, 0)!.assumingMemoryBound(to: UInt8.self)
        var g = [UInt8](repeating: 0, count: w * h)
        g.withUnsafeMutableBufferPointer { dst in
            for y in 0 ..< h { (dst.baseAddress! + y * w).update(from: base + y * bpr, count: w) }
        }
        let f = Frame(t: CMSampleBufferGetPresentationTimeStamp(sb).seconds, px: g)
        lock.lock(); width = w; height = h; frames.append(f); lock.unlock()
    }

    func snapshot() -> (frames: [Frame], w: Int, h: Int) { lock.lock(); defer { lock.unlock() }; return (frames, width, height) }
}

func fail(_ s: String) -> Never { FileHandle.standardError.write((s + "\n").data(using: .utf8)!); exit(2) }

var args = Array(CommandLine.arguments.dropFirst())
func option(_ name: String) -> String? {
    guard let i = args.firstIndex(of: name), i + 1 < args.count else { return nil }
    return args[i + 1]
}

if args.first == "--list" {
    let content = try await SCShareableContent.current
    for n in Set(content.windows.filter { $0.isOnScreen }.compactMap { $0.owningApplication?.applicationName }).sorted() { print(n) }
    exit(0)
}
guard let owner = option("--owner")?.lowercased(), let sep = args.firstIndex(of: "--"), sep + 1 < args.count else {
    fail("usage: openbench --owner <name> [--duration s] [--png path] -- command args...")
}
let duration = Double(option("--duration") ?? "10")!
let pngPath = option("--png")
let command = Array(args[(sep + 1)...])

let content = try await SCShareableContent.current
guard let display = content.displays.first(where: { $0.displayID == CGMainDisplayID() }) else { fail("no main display") }
let config = SCStreamConfiguration()
config.width = display.width / 2 // half the point size: ~0.4 MB per changed frame; text still resolves
config.height = display.height / 2
config.pixelFormat = kCVPixelFormatType_420YpCbCr8BiPlanarFullRange
let recorder = Recorder()
let stream = SCStream(filter: SCContentFilter(display: display, excludingWindows: []), configuration: config, delegate: nil)
try stream.addStreamOutput(recorder, type: .screen, sampleHandlerQueue: DispatchQueue(label: "frames"))
CGWarpMouseCursorPosition(CGPoint(x: display.frame.minX + 2, y: display.frame.maxY - 2)) // no hover effects in the window
try await stream.startCapture()
try await Task.sleep(for: .milliseconds(500))

let t0 = CMClockGetTime(CMClockGetHostTimeClock()).seconds
let proc = Process()
proc.executableURL = URL(fileURLWithPath: command[0])
proc.arguments = Array(command.dropFirst())
try proc.run()
try await Task.sleep(for: .seconds(duration))
try await stream.stopCapture()

// Region: the owner's frontmost normal window (CGWindowList is front to back), points → capture pixels.
let list = CGWindowListCopyWindowInfo([.optionOnScreenOnly, .excludeDesktopElements], kCGNullWindowID) as? [[String: Any]] ?? []
guard let win = list.first(where: {
    ($0[kCGWindowLayer as String] as? Int) == 0
        && (($0[kCGWindowOwnerName as String] as? String)?.lowercased().contains(owner) ?? false)
}), let bounds = win[kCGWindowBounds as String], let rect = CGRect(dictionaryRepresentation: bounds as! CFDictionary)
else { fail("no on-screen window for \(owner)") }
// Anything in front of the window that overlaps it (another app, a crash dialog) makes the run meaningless.
for other in list.prefix(while: { ($0[kCGWindowNumber as String] as? Int) != (win[kCGWindowNumber as String] as? Int) }) {
    guard (other[kCGWindowAlpha as String] as? Double ?? 1) > 0, (other[kCGWindowLayer as String] as? Int ?? 0) < 20,
          let b = other[kCGWindowBounds as String], let r = CGRect(dictionaryRepresentation: b as! CFDictionary),
          r.intersects(rect) else { continue } // Dock, menu bar and status items sit at layer ≥ 20
    fail("window covered by \(other[kCGWindowOwnerName as String] as? String ?? "?")")
}
let (frames, w, h) = recorder.snapshot()
let sx = Double(w) / Double(display.width), sy = Double(h) / Double(display.height)
let u = rect.offsetBy(dx: -display.frame.minX, dy: -display.frame.minY)
let x0 = max(0, Int(u.minX * sx)), x1 = min(w, Int(u.maxX * sx)), y0 = max(0, Int(u.minY * sy)), y1 = min(h, Int(u.maxY * sy))

/// True when two frames differ inside the region (more than 8 pixels changed by more than 24 grey levels).
func differs(_ a: Frame, _ b: Frame) -> Bool {
    var n = 0
    for y in y0 ..< y1 {
        let r = y * w
        for x in x0 ..< x1 where abs(Int(a.px[r + x]) - Int(b.px[r + x])) > 24 {
            n += 1
            if n > 8 { return true }
        }
    }
    return false
}

guard let base = frames.last(where: { $0.t < t0 }), let final = frames.last else { fail("no frames captured") }
let after = frames.filter { $0.t >= t0 }
let first = after.first { differs($0, base) }
// "Visually complete (99%)": from this frame on the region stays within 1% of the final frame, so late chrome
// (toolbars fading out, cursor-hiding) doesn't count while any real text reflow does.
let tolerance = max(8, (x1 - x0) * (y1 - y0) / 100)
var completeIdx = after.count
while completeIdx > 0, changed(after[completeIdx - 1], final) <= tolerance { completeIdx -= 1 }
let complete = completeIdx < after.count ? after[completeIdx] : final
let settled = t0 + duration - complete.t

/// Pixels in the region that differ from `b` by more than 24 grey levels.
func changed(_ a: Frame, _ b: Frame) -> Int {
    var n = 0
    for y in y0 ..< y1 { let r = y * w; for x in x0 ..< x1 where abs(Int(a.px[r + x]) - Int(b.px[r + x])) > 24 { n += 1 } }
    return n
}
if args.contains("--timeline") { // stderr: ms since launch, pixels still different from the final frame
    var last = -1
    for f in after { let n = changed(f, final); if n != last { FileHandle.standardError.write("\(ms(f.t)) \(n)\n".data(using: .utf8)!); last = n } }
}

if let pngPath {
    let cw = x1 - x0, ch = y1 - y0
    var crop = [UInt8](repeating: 0, count: cw * ch)
    for y in 0 ..< ch { for x in 0 ..< cw { crop[y * cw + x] = final.px[(y0 + y) * w + x0 + x] } }
    let ctx = CGContext(data: &crop, width: cw, height: ch, bitsPerComponent: 8, bytesPerRow: cw,
                        space: CGColorSpaceCreateDeviceGray(), bitmapInfo: CGImageAlphaInfo.none.rawValue)!
    let dest = CGImageDestinationCreateWithURL(URL(fileURLWithPath: pngPath) as CFURL, UTType.png.identifier as CFString, 1, nil)!
    CGImageDestinationAddImage(dest, ctx.makeImage()!, nil)
    CGImageDestinationFinalize(dest)
}

func ms(_ t: Double) -> Int { Int(((t - t0) * 1000).rounded()) }
let out: [String: Any] = [
    "first_ms": first.map { ms($0.t) } ?? -1,
    "complete_ms": ms(complete.t),
    "settled_s": (settled * 10).rounded() / 10, // quiet time before capture ended; < 1.5 s means "maybe not finished"
    "frames": after.count,
    "window": [Int(u.width), Int(u.height)],
]
print(String(data: try JSONSerialization.data(withJSONObject: out, options: [.sortedKeys]), encoding: .utf8)!)
exit(0)
