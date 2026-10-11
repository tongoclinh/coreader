# WebKit reference renderer for CoReader drop caps (P0 research)

**Outcome.** The approach works and has been verified by running it. A 130-line `swiftc` CLI renders a Vietnamese paragraph in an offscreen `WKWebView`, waits for `document.fonts.ready`, snapshots it to a 1200×404 px PNG (600 CSS px at 2x), and extracts the drop-cap geometry. One render takes 0.2–0.35 s inside the process. The first cold launch took 0.9 s wall time; warm launches took 0.26 s. WebKit sizes and places the cap exactly as our §8 contract requires: cap ink top = cap line of line 1 (within 0.03 px), and cap ink bottom = baseline of line N (0.00 px). Use only the **`-webkit-` prefix**, because the unprefixed property does nothing in this WebKit.

Environment: macOS 27.0.1 (26A434), Safari 27.0.1, WebKit 22625.1.29.11.28, Swift 6.4.
Files (all in `/tmp/coreader-research/WebKitReferenceResearch/`):
- `render.swift` and `render`: the experiment.
- `wk3.png`: `-webkit-initial-letter: 3`.
- `wk32.png`: `3 2`.
- `std3.png`: unprefixed.
- `dia_Ở.png`, `dia_Đ.png`, `dia_Q.png`.
- `render3.swift`: variant without NSApplication.

## 1. WebKit support for initial-letter
- **Unprefixed `initial-letter` is unsupported.** I verified this in a run: `CSS.supports('initial-letter','3')` returned `false`, the computed style stayed `normal`, and `std3.png` shows an ordinary 18 px "M". MDN BCD (`css/properties/initial-letter.json`, fetched today) lists Safari as `prefix: "-webkit-"`, `version_added: "9"`, and points to WebKit bug 229090 for the unprefixed form. Chrome supports it unprefixed from version 110; Firefox does not support it.
- **`-webkit-initial-letter: N` and `N M` both work** (verified). `CSS.supports` returned true for `'3'` and for `'3 2'`, and the computed `webkitInitialLetter` was `"3"` and `"3 2"`. With `3 2`, the cap keeps the size of a 3-line cap but sinks only 2 lines. The paragraph's line 1 moves down one line pitch (rect top 23.27 → 50.27), so the raised part stays inside the paragraph. BCD also notes that iOS WebKit has no decimal values (bug 296785). This does not matter because profile §6 allows only integers from 2 to 5.
- **`@font-face` fonts work in `::first-letter`** (verified). `document.fonts` reported `BookSerif:loaded` and `CapFont:loaded`. The computed first-letter `font-family` was `CapFont` (Times New Roman Bold copied to `cap.ttf`), and the PNG visibly shows a Times Bold cap over a Georgia body. `font-weight: bold` combined with `@font-face … font-weight:bold` also resolved.
- **Alignment uses cap-height** (verified numerically for `wk3`; the body font is Georgia at 18px/27px):
  - CoreText metrics of `body.ttf`: ascent 16.51, descent 3.95, capHeight 12.47 (`CTFontGetCapHeight`, i.e. OS/2 sCapHeight).
  - Line 1 ink baseline is 39.50, so the cap line is 39.50 − 12.47 = **27.03**. The ink top of the cap "M" is **27.00**.
  - Line 3 ink baseline is **93.50**. The ink bottom of the cap "M" is **93.50**.
  - Cap ink height is 66.5 = 2·27 + 12.47. This is exactly the formula in local spec `css-inline-3.md` (lines 1024–1028: "(N–1)·line-height + cap-height of para"). Spec lines 744 and 966 make cap-height plus alphabetic the default for Latin.
  - Lines 1–3 start at x=118, which is the right edge of the first-letter box (118.08). Line 4 starts at x=24. "Lines 1 to N are shortened" therefore holds.
- **Diacritics:** for "Ở" the ink runs from y 4.5 to 95.0. The hook and horn rise above the cap line and spill above the paragraph's top edge (y=20) into the body padding. "O" also overshoots the baseline by about 1.5 px. "Đ" behaves exactly like "M" (27.00–93.50). This matches spec line 740 ("the accent extends above the paragraph") and the owner's decision that diacritic glitches are acceptable.

## 2. Running WKWebView from a CLI
I verified that no app bundle, no Info.plist, and no entitlements are needed.
- **Run loop:** `NSApplication.shared` with `setActivationPolicy(.prohibited)` and `app.run()` works. Plain `RunLoop.main.run()` with no NSApplication also works (`render3`). Drive everything from a `Task { @MainActor in … ; exit(0) }`.
- **Window:** a `WKWebView` with no window rendered and snapshotted correctly at `devicePixelRatio` 2. An offscreen borderless `NSWindow` at (−10000, −10000) gave identical output. [INFERENCE] Without a window the scale probably comes from the main screen, so a non-Retina or headless CI host could give 1x. The tool should assert that the CGImage width is 1200 and fail otherwise.
- **Loading and fonts:** `loadHTMLString(html, baseURL: dir)` with a `file://` directory base loaded the relative `url(body.ttf)` fonts. `loadFileURL(_:allowingReadAccessTo:)` gave identical results. Declarations are in the SDK header `WebKit.framework/Versions/A/Headers/WKWebView.h:146,153`.
- **Waiting:** wait for `didFinish` through `WKNavigationDelegate`, then call `callAsyncJavaScript("await document.fonts.ready; …", contentWorld: .page)`. That call awaits the returned promise (`WKWebView.h:363`, macOS 11+).
- **Snapshot:** `takeSnapshot(configuration:)` (`WKWebView.h:443`, async name). `WKSnapshotConfiguration.snapshotWidth` is **in points** (`WKSnapshotConfiguration.h:45`), and the pixel width is snapshotWidth × backing scale. I measured this: `snapshotWidth=1200` produced 2400 px, and `600` produced 1200 px. Resize the web view to the body height before taking the snapshot, because `rect` must lie inside the view.
- **PNG:** `img.cgImage(forProposedRect:…)` → `NSBitmapImageRep(cgImage:).representation(using: .png, …)`.
- **Fallbacks** (not needed): a tiny `.app` target, or `WKWebView.createPDF`. `NSAttributedString(html:)` cannot serve as the reference. AppKit headers contain no initial-letter or drop-cap attribute (I grepped `AppKit.framework/Headers` and found 0 matches), so it cannot represent `initial-letter`.

## 3. Geometry extraction: recommendation
I recommend (b) pixel analysis, with color separation and JS line boxes. Make the reference HTML add `color:#f00` to `::first-letter`. This is reference-only CSS: the cap's ink is then simply the bbox of the red pixels, with no DOM node required. Supplement the bbox with:
- **JS Range rects** for line boxes. Group the per-character `getBoundingClientRect` results of the text node, from index 1 onward, by `top`. In WebKit, a Range over character 0 returns the **first-letter box** (here 24..118.08 × 4.47..114.86, the cap font's ascent+descent box). That box is useful for the x position where text starts on the shortened lines.
- **Baselines:** `rect.top + CTFontGetAscent(bodyFont)`. The text rect height of 20.44 equals ascent + descent, so the rect is the content box centered by half-leading. This predicted 39.77, while the ink baseline (densest serif row) was 39.50. WebKit snaps glyphs to the device-pixel grid, so expect a tolerance of 0.5 CSS px and compare ink to ink.

Option (a), duplicating the first letter as a span, adds a second layout that can differ from the real one, so I rejected it. For pixel-exact checks, use flat-topped and flat-bottomed test letters (M, N, H, T, Đ). Round letters (O, Q) include overshoot and tails, so compare them against CoreText glyph bounds, not against metric lines.

## 4. Recipe (verified, excerpted from `render.swift`)
```swift
import AppKit; import WebKit
@MainActor final class Nav: NSObject, WKNavigationDelegate {
  var c: CheckedContinuation<Void, Error>?
  func webView(_ w: WKWebView, didFinish n: WKNavigation!) { c?.resume(); c = nil }
  func webView(_ w: WKWebView, didFailProvisionalNavigation n: WKNavigation!, withError e: Error) { c?.resume(throwing: e); c = nil }
}
@MainActor func render(html: String, dir: URL, out: URL) async throws -> [String: Any] {
  let web = WKWebView(frame: NSRect(x: 0, y: 0, width: 600, height: 800))
  let nav = Nav(); web.navigationDelegate = nav
  try await withCheckedThrowingContinuation { nav.c = $0; web.loadHTMLString(html, baseURL: dir) }
  let json = try await web.callAsyncJavaScript("""
    await document.fonts.ready;
    const p = document.querySelector('p'), t = p.firstChild, r = document.createRange(), lines = [];
    for (let i = 1; i < t.length; i++) { r.setStart(t,i); r.setEnd(t,i+1); const b = r.getBoundingClientRect();
      if (!b.width) continue; const l = lines.at(-1);
      if (!l || b.top > l.top + 4) lines.push({top:b.top,bottom:b.bottom,left:b.left}); }
    return JSON.stringify({lines, height: Math.ceil(document.body.getBoundingClientRect().bottom),
      fonts: [...document.fonts].map(f => f.family + ':' + f.status)});
    """, contentWorld: .page) as! String
  let m = try JSONSerialization.jsonObject(with: Data(json.utf8)) as! [String: Any]
  let h = (m["height"] as! NSNumber).doubleValue
  web.setFrameSize(NSSize(width: 600, height: h))
  let cfg = WKSnapshotConfiguration()
  cfg.rect = CGRect(x: 0, y: 0, width: 600, height: h); cfg.snapshotWidth = 600 // points → 1200 px @2x
  let img = try await web.takeSnapshot(configuration: cfg)
  var rect = CGRect(origin: .zero, size: img.size)
  let cg = img.cgImage(forProposedRect: &rect, context: nil, hints: nil)!
  precondition(cg.width == 1200, "expected 2x backing scale")
  try NSBitmapImageRep(cgImage: cg).representation(using: .png, properties: [:])!.write(to: out)
  return m // then: red-pixel bbox of cg (r>160,g<110,b<110) / 2 = drop-cap ink in CSS px
}
// main.swift: let app = NSApplication.shared; app.setActivationPolicy(.prohibited)
// Task { @MainActor in try! await render(...); exit(0) }; app.run()
// CSS: p::first-letter{-webkit-initial-letter:3;font-family:CapFont;color:#f00}  @font-face src:url(cap.ttf)
```
Build and run: `swiftc -O -o render render.swift && ./render wk3.png "-webkit-initial-letter: 3" string nowindow`.

Measured output (`wk3`): `dropcap ink bbox x 26.00..116.50 y 27.00..93.50`, `line 1 ink-baseline 39.50`, `line 3 ink-baseline 93.50`, `elapsed 0.19–0.36s`.

## Limitations
- I tested one font pair (Georgia body, Times Bold cap) at a single size and line-height. Fonts with unusual OS/2 cap-height, or synthetic bold, are untested.
- I did not test a preceding block, so I have not checked whether WebKit pushes the paragraph down for an accent ink above the cap ("Ở" spilled into the body padding). Spec line 1254 says the content box includes all ink. Our renderer must decide how to handle this; the reference cannot decide it for us.
- `margin-right` on `::first-letter` and drop caps that cross a page or column break were not exercised. The page-break behavior is not testable in a scrolling WKWebView anyway.

## Unresolved questions
1. Should the CoreText-vs-WebKit comparison use an ink-to-ink tolerance of ±0.5 CSS px (as measured), or do we snap our renderer to the device-pixel grid the way WebKit does?
2. Should the reference generator rewrite the book's unprefixed `initial-letter` to `-webkit-initial-letter`? This is required for Safari to render it at all.
3. What should our renderer do with diacritic ink above the paragraph's top edge (push the paragraph down per spec 1254, or let it overflow the way WebKit did here)?
