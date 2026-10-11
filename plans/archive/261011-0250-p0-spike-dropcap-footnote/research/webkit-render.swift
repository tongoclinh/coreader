// Usage: render <out.png> '<first-letter decl>' [string|file] [window|nowindow] [snapshotWidth]
import AppKit
import WebKit
import CoreText

let args = CommandLine.arguments
let outPath = args[1]
let decl = args.count > 2 ? args[2] : "-webkit-initial-letter: 3"
let loadMode = args.count > 3 ? args[3] : "string"
let windowMode = args.count > 4 ? args[4] : "window"
let snapWidth = args.count > 5 ? Double(args[5])! : 600
let dir = URL(fileURLWithPath: "/tmp/coreader-research/WebKitReferenceResearch/", isDirectory: true)
let cssWidth = 600.0, fontSize = 18.0, lineHeight = 27.0

let text = "Mùa thu năm ấy, khi những cơn gió đầu tiên lùa qua con hẻm nhỏ, tôi vẫn còn nhớ như in dáng mẹ ngồi bên hiên nhà, đôi tay gầy guộc khâu lại chiếc áo cũ đã sờn vai. Bà không nói gì nhiều, chỉ thỉnh thoảng ngước lên nhìn trời rồi khẽ thở dài, như thể đang đợi một điều gì đó sẽ chẳng bao giờ trở lại. Tôi ngồi cạnh bà, lặng lẽ nghe tiếng lá khô xào xạc trên mái tôn."
let html = """
<!doctype html><html lang="vi"><head><meta charset="utf-8"><style>
@font-face{font-family:BookSerif;src:url(body.ttf)}
@font-face{font-family:CapFont;src:url(cap.ttf);font-weight:bold}
html,body{margin:0;background:#fff}
body{width:\(Int(cssWidth))px;padding:20px 24px;box-sizing:border-box}
p{font-family:BookSerif;font-size:\(Int(fontSize))px;line-height:\(Int(lineHeight))px;color:#000;margin:0;text-align:justify}
p::first-letter{\(decl);font-family:CapFont;font-weight:bold;color:#f00}
</style></head><body><p>\(text)</p></body></html>
"""

let measureJS = """
await document.fonts.ready;
const p = document.querySelector('p'), t = p.firstChild, r = document.createRange();
const rect = b => ({top:b.top,bottom:b.bottom,left:b.left,right:b.right});
r.setStart(t,0); r.setEnd(t,1); const fl = rect(r.getBoundingClientRect());
const lines = [];
for (let i = 1; i < t.length; i++) {
  r.setStart(t,i); r.setEnd(t,i+1); const b = r.getBoundingClientRect();
  if (b.width === 0) continue;
  const last = lines[lines.length-1];
  if (!last || b.top > last.top + 4) lines.push(rect(b)); else last.right = Math.max(last.right, b.right);
}
const cs = getComputedStyle(p, '::first-letter');
return JSON.stringify({
  supports: {std3: CSS.supports('initial-letter','3'), wk3: CSS.supports('-webkit-initial-letter','3'), wk32: CSS.supports('-webkit-initial-letter','3 2')},
  fonts: [...document.fonts].map(f => f.family + ':' + f.status),
  flStyle: {initialLetter: cs.initialLetter, webkitInitialLetter: cs.webkitInitialLetter, fontFamily: cs.fontFamily},
  firstLetterRange: fl, lines: lines.slice(0,5), height: Math.ceil(document.body.getBoundingClientRect().bottom), dpr: devicePixelRatio});
"""

@MainActor final class Loader: NSObject, WKNavigationDelegate {
    var done: CheckedContinuation<Void, Error>?
    func webView(_ w: WKWebView, didFinish n: WKNavigation!) { done?.resume(); done = nil }
    func webView(_ w: WKWebView, didFail n: WKNavigation!, withError e: Error) { done?.resume(throwing: e); done = nil }
    func webView(_ w: WKWebView, didFailProvisionalNavigation n: WKNavigation!, withError e: Error) { done?.resume(throwing: e); done = nil }
}

@MainActor func run() async throws {
    let t0 = Date()
    let web = WKWebView(frame: NSRect(x: 0, y: 0, width: cssWidth, height: 800))
    var window: NSWindow?
    if windowMode == "window" {
        let w = NSWindow(contentRect: NSRect(x: -10000, y: -10000, width: cssWidth, height: 800), styleMask: .borderless, backing: .buffered, defer: false)
        w.contentView = web; w.orderFrontRegardless(); window = w
    }
    let loader = Loader(); web.navigationDelegate = loader
    try await withCheckedThrowingContinuation { (c: CheckedContinuation<Void, Error>) in
        loader.done = c
        if loadMode == "file" {
            let f = dir.appendingPathComponent("page.html"); try! html.write(to: f, atomically: true, encoding: .utf8)
            web.loadFileURL(f, allowingReadAccessTo: dir)
        } else { web.loadHTMLString(html, baseURL: dir) }
    }
    let json = try await web.callAsyncJavaScript(measureJS, contentWorld: .page) as! String
    print("JS:", json)
    let m = try JSONSerialization.jsonObject(with: Data(json.utf8)) as! [String: Any]
    let h = (m["height"] as! NSNumber).doubleValue
    web.setFrameSize(NSSize(width: cssWidth, height: h)); window?.setContentSize(NSSize(width: cssWidth, height: h))
    let cfg = WKSnapshotConfiguration()
    cfg.rect = CGRect(x: 0, y: 0, width: cssWidth, height: h)
    cfg.snapshotWidth = NSNumber(value: snapWidth)
    let img = try await web.takeSnapshot(configuration: cfg)
    var r = CGRect(origin: .zero, size: img.size)
    let cg = img.cgImage(forProposedRect: &r, context: nil, hints: nil)!
    let png = NSBitmapImageRep(cgImage: cg).representation(using: .png, properties: [:])!
    try png.write(to: URL(fileURLWithPath: outPath))
    print("window backingScale:", window?.backingScaleFactor ?? -1, "img.size(pt):", img.size, "pixels:", cg.width, "x", cg.height)
    analyze(cg, m)
    print(String(format: "elapsed: %.2fs", Date().timeIntervalSince(t0)))
}

func analyze(_ cg: CGImage, _ m: [String: Any]) {
    let W = cg.width, H = cg.height, s = Double(W) / cssWidth
    var px = [UInt8](repeating: 0, count: W * H * 4)
    let ctx = CGContext(data: &px, width: W, height: H, bitsPerComponent: 8, bytesPerRow: W * 4, space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
    ctx.draw(cg, in: CGRect(x: 0, y: 0, width: W, height: H)) // row 0 = top in memory
    func at(_ x: Int, _ y: Int) -> (Int, Int, Int) { let i = (y * W + x) * 4; return (Int(px[i]), Int(px[i+1]), Int(px[i+2])) }
    var (x0, y0, x1, y1) = (W, H, -1, -1)
    for y in 0..<H { for x in 0..<W { let (r, g, b) = at(x, y); if r > 160 && g < 110 && b < 110 { x0 = min(x0, x); y0 = min(y0, y); x1 = max(x1, x); y1 = max(y1, y) } } }
    guard x1 >= 0 else { print("no red drop-cap ink found"); return }
    print(String(format: "dropcap ink bbox (css px): x %.2f..%.2f  y %.2f..%.2f", Double(x0)/s, Double(x1+1)/s, Double(y0)/s, Double(y1+1)/s))
    // Body-font metrics from the same file WebKit loaded.
    let gf = CGFont(CGDataProvider(url: dir.appendingPathComponent("body.ttf") as CFURL)!)!
    let f = CTFontCreateWithGraphicsFont(gf, fontSize, nil, nil)
    let asc = CTFontGetAscent(f), desc = CTFontGetDescent(f), cap = CTFontGetCapHeight(f)
    print(String(format: "body CT metrics @%.0fpx: ascent %.2f descent %.2f capHeight %.2f", fontSize, asc, desc, cap))
    let lines = m["lines"] as! [[String: Double]]
    let xStart = Int((Double(x1) / s + 4) * s)
    for (i, l) in lines.prefix(4).enumerated() {
        // Ink baseline: densest black row in lower half of the line's text rect, right of the cap (serifs sit on the baseline).
        let top = Int(l["top"]! * s), bot = Int(l["bottom"]! * s), mid = (top + bot) / 2
        var best = (row: mid, n: 0)
        for y in mid..<min(bot, H) { var n = 0; for x in xStart..<W { let (r, g, b) = at(x, y); if max(r, g, b) < 100 { n += 1 } }; if n > best.n { best = (y, n) } }
        let ctBase = l["top"]! + asc
        print(String(format: "line %d rect y %.2f..%.2f  baseline(rect.top+asc) %.2f  ink-baseline %.2f  capline %.2f", i+1, l["top"]!, l["bottom"]!, ctBase, Double(best.row + 1)/s, ctBase - cap))
    }
}

let app = NSApplication.shared
app.setActivationPolicy(.prohibited)
Task { @MainActor in
    do { try await run(); exit(0) } catch { print("ERROR:", error); exit(1) }
}
app.run()
