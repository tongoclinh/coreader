// WebKit reference renderer: drop-cap geometry (P0) and computed-style parity (P2). Reference only, never shipped.
// usage: webref <page.xhtml> --root <dir> --out <png> --geometry <json> [--clip <css px>]
//        webref <page.xhtml> --root <dir> --styles <json>   (computed style of every body element, P2 parity)
// The page links its own CSS: frame.css (page geometry), the book CSS, then reader.css (user CSS stand-in).
import AppKit
import ImageIO
import WebKit

let args = Array(CommandLine.arguments.dropFirst())
func option(_ name: String) -> String? { args.firstIndex(of: name).flatMap { $0 + 1 < args.count ? args[$0 + 1] : nil } }
let stylesPath = option("--styles")
guard let page = args.first, let root = option("--root"),
      stylesPath != nil || (option("--out") != nil && option("--geometry") != nil) else {
    FileHandle.standardError.write(Data("usage: webref <page.xhtml> --root <dir> (--out <png> --geometry <json> [--clip <px>] | --styles <json>)\n".utf8))
    exit(2)
}
let out = option("--out") ?? "", geometryPath = option("--geometry") ?? ""
let clip = option("--clip").flatMap(Double.init) ?? 100_000
let cssWidth = 600.0

/// Lines from the drop-cap paragraph onwards: per-character rects of every text node (asides skipped),
/// grouped by top; the first-letter characters give the cap box.
let measureJS = """
await document.fonts.ready;
const clip = \(clip);
const ps = [...document.querySelectorAll('p')];
const dc = ps.find(p => { const v = getComputedStyle(p, '::first-letter').webkitInitialLetter; return v && v !== 'normal'; });
if (!dc) return JSON.stringify({error: 'no initial-letter paragraph'});
const seg = new Intl.Segmenter(undefined, {granularity: 'grapheme'});
const w = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT);
const r = document.createRange();
let capBox = null, lines = [], started = false, capLeft = -1;
for (let t = w.nextNode(); t; t = w.nextNode()) {
  if (t.parentElement.closest('aside')) continue;
  if (!started) { if (!dc.contains(t) || !t.data.trim()) continue; started = true;
    const s = t.data.replace(/^\\s+/, ''); const lead = t.data.length - s.length;
    let k = 0; while (k < s.length && /\\p{P}/u.test(s[k])) k++;
    const g = [...seg.segment(s.slice(k))][0]; k += g ? g.segment.length : 0;
    while (k < s.length && /\\p{P}/u.test(s[k])) k++;
    r.setStart(t, lead); r.setEnd(t, lead + k); const b = r.getBoundingClientRect();
    capBox = {minX: b.left, maxX: b.right}; capLeft = lead + k;
  }
  for (let i = capLeft >= 0 ? capLeft : 0; i < t.length; i++) {
    r.setStart(t, i); r.setEnd(t, i + 1); const b = r.getBoundingClientRect();
    if (!b.width) continue;
    if (b.top > clip) break;
    const last = lines.at(-1);
    if (!last || b.top > last.top + 4) lines.push({top: b.top, left: b.left});
    else last.left = Math.min(last.left, b.left);
  }
  capLeft = -1;
}
return JSON.stringify({capBox, lines, height: Math.ceil(document.documentElement.getBoundingClientRect().height),
  fonts: [...document.fonts].map(f => f.family + ':' + f.status)});
"""

/// Same fields as `coreader styles`: px numbers, keywords lowercased; `%` text-indent resolved against the containing block.
let stylesJS = """
await document.fonts.ready;
const px = v => parseFloat(v);
const content = e => { const c = getComputedStyle(e), r = e.getBoundingClientRect();
  return r.width - px(c.paddingLeft) - px(c.paddingRight) - px(c.borderLeftWidth) - px(c.borderRightWidth); };
return JSON.stringify([document.body, ...document.body.querySelectorAll('*')].map(e => {
  const c = getComputedStyle(e);
  let block = e.parentElement; while (block && getComputedStyle(block).display === 'inline') block = block.parentElement;
  const len = v => v.endsWith('%') ? px(v) / 100 * content(block) : px(v); // WebKit leaves some % unresolved
  const indent = len(c.textIndent);
  return {tag: e.localName, family: c.fontFamily.split(',')[0].trim().replace(/^["']|["']$/g, ''),
    fontSize: px(c.fontSize), weight: +c.fontWeight, italic: c.fontStyle !== 'normal',
    lineHeight: c.lineHeight === 'normal' ? null : px(c.lineHeight),
    align: c.textAlign === 'start' ? 'left' : c.textAlign === 'end' ? 'right' : c.textAlign,
    indent, display: c.display === 'list-item' ? 'block' : c.display,
    marginTop: len(c.marginTop), marginRight: len(c.marginRight), marginBottom: len(c.marginBottom), marginLeft: len(c.marginLeft),
    verticalAlign: c.verticalAlign};
}));
"""

@MainActor final class Loader: NSObject, WKNavigationDelegate {
    var done: CheckedContinuation<Void, Error>?
    func webView(_ w: WKWebView, didFinish n: WKNavigation!) { done?.resume(); done = nil }
    func webView(_ w: WKWebView, didFail n: WKNavigation!, withError e: Error) { done?.resume(throwing: e); done = nil }
    func webView(_ w: WKWebView, didFailProvisionalNavigation n: WKNavigation!, withError e: Error) { done?.resume(throwing: e); done = nil }
}

struct Failure: Error { let message: String }

@MainActor func run() async throws {
    let web = WKWebView(frame: NSRect(x: 0, y: 0, width: cssWidth, height: 800))
    let loader = Loader()
    web.navigationDelegate = loader
    try await withCheckedThrowingContinuation { (c: CheckedContinuation<Void, Error>) in
        loader.done = c
        web.loadFileURL(URL(fileURLWithPath: page), allowingReadAccessTo: URL(fileURLWithPath: root, isDirectory: true))
    }
    if let stylesPath {
        guard let json = try await web.callAsyncJavaScript(stylesJS, contentWorld: .page) as? String else { throw Failure(message: "styles failed") }
        try Data(json.utf8).write(to: URL(fileURLWithPath: stylesPath))
        return
    }
    guard let json = try await web.callAsyncJavaScript(measureJS, contentWorld: .page) as? String,
          var m = try JSONSerialization.jsonObject(with: Data(json.utf8)) as? [String: Any] else { throw Failure(message: "measure failed") }
    if let e = m["error"] { throw Failure(message: "\(e)") }
    if let fonts = m["fonts"] as? [String], let bad = fonts.first(where: { $0.hasSuffix(":error") }) {
        throw Failure(message: "font failed to load: \(bad)")
    }
    let height = min((m["height"] as! NSNumber).doubleValue, clip)
    web.setFrameSize(NSSize(width: cssWidth, height: height))
    let cfg = WKSnapshotConfiguration()
    cfg.rect = CGRect(x: 0, y: 0, width: cssWidth, height: height)
    cfg.snapshotWidth = NSNumber(value: cssWidth) // points → 1200 px at 2x
    let img = try await web.takeSnapshot(configuration: cfg)
    var rect = CGRect(origin: .zero, size: img.size)
    guard let cg = img.cgImage(forProposedRect: &rect, context: nil, hints: nil), cg.width == 1200 else {
        throw Failure(message: "snapshot is not 1200 px wide (needs a 2x backing scale)")
    }
    let url = URL(fileURLWithPath: out)
    try FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
    guard let dest = CGImageDestinationCreateWithURL(url as CFURL, "public.png" as CFString, 1, nil) else { throw Failure(message: "cannot write \(out)") }
    CGImageDestinationAddImage(dest, cg, nil)
    guard CGImageDestinationFinalize(dest) else { throw Failure(message: "cannot write \(out)") }
    m.removeValue(forKey: "fonts")
    m.removeValue(forKey: "height")
    try JSONSerialization.data(withJSONObject: m, options: [.sortedKeys]).write(to: URL(fileURLWithPath: geometryPath))
}

Task { @MainActor in
    do { try await run(); exit(0) } catch {
        FileHandle.standardError.write(Data("webref: \(error)\n".utf8))
        exit(1)
    }
}
RunLoop.main.run()
