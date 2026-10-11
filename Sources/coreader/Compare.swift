import CoReaderEngine
import CoreGraphics
import Foundation
import ImageIO

/// RGBA pixels of a PNG, row 0 = top.
struct Bitmap {
    let width: Int, height: Int
    var px: [UInt8]
    let image: CGImage

    init(_ path: String) throws {
        guard let src = CGImageSourceCreateWithURL(URL(fileURLWithPath: path) as CFURL, nil),
              let img = CGImageSourceCreateImageAtIndex(src, 0, nil) else { throw CLIError(description: "cannot read \(path)") }
        image = img; width = img.width; height = img.height
        px = [UInt8](repeating: 0, count: width * height * 4)
        let ctx = CGContext(data: &px, width: width, height: height, bitsPerComponent: 8, bytesPerRow: width * 4,
                            space: CGColorSpace(name: CGColorSpace.sRGB)!, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
        ctx.draw(img, in: CGRect(x: 0, y: 0, width: width, height: height))
    }

    /// Bounding box of red ink (the drop cap), in CSS px at `scale`.
    func redBox(scale: Double) -> (minX: Double, minY: Double, maxX: Double, maxY: Double)? {
        var x0 = width, y0 = height, x1 = -1, y1 = -1
        for y in 0..<height {
            for x in 0..<width {
                let i = (y * width + x) * 4
                if px[i] > 160 && px[i + 1] < 110 && px[i + 2] < 110 {
                    x0 = min(x0, x); y0 = min(y0, y); x1 = max(x1, x); y1 = max(y1, y)
                }
            }
        }
        guard x1 >= 0 else { return nil }
        return (Double(x0) / scale, Double(y0) / scale, Double(x1 + 1) / scale, Double(y1 + 1) / scale)
    }
}

struct CompareRow: Codable {
    var name: String
    var kind: String
    /// Ours − WebKit, CSS px, y relative to line 1's top in each renderer.
    var capTop: Double
    var capBottom: Double
    var capLeftOurs: Double
    var capLeftWebKit: Double
    /// Max |Δ| of line start x over the first lines (lines 1…N and the next one).
    var lineStartMax: Double
    var lineStarts: [Double]
    /// Max |Δ| of line tops relative to line 1 (reported, not judged).
    var lineTopMax: Double
    var judged: [String]
    var pass: Bool
}

func compare(_ a: Args) throws {
    let scale = 2.0
    let ours = try Bitmap(try a.input(0)), wk = try Bitmap(try a.input(2))
    let og = try JSONDecoder().decode(Geometry.self, from: Data(contentsOf: URL(fileURLWithPath: try a.input(1))))
    let wg = try JSONDecoder().decode(Geometry.self, from: Data(contentsOf: URL(fileURLWithPath: try a.input(3))))
    guard wk.width == 1200 else { throw CLIError(description: "WebKit reference is \(wk.width) px wide, expected 1200 (2x)") }
    guard let oc = ours.redBox(scale: scale), let wc = wk.redBox(scale: scale) else { throw CLIError(description: "no red cap ink found") }
    guard let o1 = og.lines.first, let w1 = wg.lines.first else { throw CLIError(description: "no lines in geometry") }

    let n = min(og.lines.count, wg.lines.count, 6)
    let starts = (0..<n).map { og.lines[$0].left - wg.lines[$0].left }
    let tops = (0..<n).map { (og.lines[$0].top - o1.top) - (wg.lines[$0].top - w1.top) }
    let kind = try a.required("--kind")
    var row = CompareRow(
        name: try a.required("--name"), kind: kind,
        capTop: (oc.minY - o1.top) - (wc.minY - w1.top),
        capBottom: (oc.maxY - o1.top) - (wc.maxY - w1.top),
        capLeftOurs: oc.minX, capLeftWebKit: wc.minX,
        lineStartMax: starts.map(abs).max() ?? 0, lineStarts: starts,
        lineTopMax: tops.map(abs).max() ?? 0, judged: [], pass: true)
    // S5: flat letters ≤ 1 px on cap top and bottom; diacritics judged on the bottom only; line starts ≤ 2 px.
    row.judged = kind == "flat" ? ["capTop", "capBottom", "lineStart"] : ["capBottom", "lineStart"]
    row.pass = abs(row.capBottom) <= 1 && row.lineStartMax <= 2 && (kind != "flat" || abs(row.capTop) <= 1)
    try writeJSON(row, to: try a.required("--row"))

    // Side-by-side: ours | WebKit, with our guides mapped into both frames via line 1's top.
    let gap = 20
    let canvas = CGContext(data: nil, width: ours.width + gap + wk.width, height: max(ours.height, wk.height), bitsPerComponent: 8,
                           bytesPerRow: 0, space: CGColorSpace(name: CGColorSpace.sRGB)!, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
    let H = Double(canvas.height)
    canvas.setFillColor(CGColor(gray: 0.85, alpha: 1))
    canvas.fill(CGRect(x: 0, y: 0, width: canvas.width, height: canvas.height))
    canvas.draw(ours.image, in: CGRect(x: 0, y: Int(H) - ours.height, width: ours.width, height: ours.height))
    canvas.draw(wk.image, in: CGRect(x: ours.width + gap, y: Int(H) - wk.height, width: wk.width, height: wk.height))
    let colors = [CGColor(srgbRed: 0, green: 0.4, blue: 1, alpha: 1), CGColor(srgbRed: 0, green: 0.7, blue: 0.2, alpha: 1)]
    canvas.setLineWidth(1)
    for (k, y) in (og.guides ?? []).enumerated() {
        canvas.setStrokeColor(colors[k % 2])
        let yo = H - y * scale, yw = H - (y - o1.top + w1.top) * scale
        canvas.strokeLineSegments(between: [CGPoint(x: 0, y: yo), CGPoint(x: Double(ours.width), y: yo)])
        canvas.strokeLineSegments(between: [CGPoint(x: Double(ours.width + gap), y: yw), CGPoint(x: Double(ours.width + gap + wk.width), y: yw)])
    }
    try Canvas.writePNG(canvas.makeImage()!, to: URL(fileURLWithPath: try a.required("--out")), scale: scale)
    print(String(format: "%@ %@: capTop %+.2f capBottom %+.2f capLeft %.2f/%.2f lineStart max %.2f lineTop max %.2f → %@",
                 row.name, kind, row.capTop, row.capBottom, row.capLeftOurs, row.capLeftWebKit, row.lineStartMax, row.lineTopMax,
                 row.pass ? "PASS" : "OUT OF TOLERANCE"))
}
