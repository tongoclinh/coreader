// CoreText initial-letter + justified paragraph layout spike.
// Build: swiftc -O -swift-version 6 main.swift -o ctl && ./ctl
import Foundation
import CoreText
import CoreGraphics
import ImageIO
import AppKit // only for the hyphenationFactor probe

let outDir = "/tmp/coreader-research/CoreTextLayoutResearch"
let fontPath = "/System/Library/Fonts/Supplemental/Times New Roman.ttf"
let capFontPath = "/System/Library/Fonts/Supplemental/Times New Roman Bold.ttf"

// MARK: fonts from bytes, no global registration
func loadDescriptor(_ path: String) -> CTFontDescriptor {
    let data = try! Data(contentsOf: URL(fileURLWithPath: path)) as CFData
    let descs = CTFontManagerCreateFontDescriptorsFromData(data) as! [CTFontDescriptor]
    return descs[0]
}
nonisolated(unsafe) let bodyDesc = loadDescriptor(fontPath)
let capDesc = loadDescriptor(capFontPath)
nonisolated(unsafe) let body = CTFontCreateWithFontDescriptor(bodyDesc, 18, nil)
nonisolated(unsafe) let capBase = CTFontCreateWithFontDescriptor(capDesc, 100, nil)

let W: CGFloat = 600, H: CGFloat = 900, L: CGFloat = 27 // column, page, line-height (1.5)
let margin: CGFloat = 40, scale: CGFloat = 2

struct Placed { let line: CTLine; let x: CGFloat; let baseline: CGFloat } // baseline: pt from page top
struct Exclusion { var bottom: CGFloat; var right: CGFloat }           // page-top coords

func attr(_ s: String, _ f: CTFont) -> CFAttributedString {
    NSAttributedString(string: s, attributes: [
        NSAttributedString.Key(kCTFontAttributeName as String): f,
        NSAttributedString.Key(kCTLanguageAttributeName as String): "vi",
    ])
}

/// ::first-letter = leading punctuation + one grapheme (Character handles NFD clusters).
func splitFirstLetter(_ s: String) -> (String, String) {
    var i = s.startIndex
    while i < s.endIndex, s[i].isPunctuation { i = s.index(after: i) }
    if i < s.endIndex { i = s.index(after: i) }
    return (String(s[..<i]), String(s[i...]))
}

/// Lays out one paragraph at `top`; returns new top. `n`/`sink` = initial-letter N M.
func layoutParagraph(_ text: String, top topIn: CGFloat, n: Int? = nil, sink: Int? = nil,
                     capMarginRight: CGFloat = 4, excl: inout Exclusion?, out: inout [Placed]) -> CGFloat {
    var top = topIn
    let a = CTFontGetAscent(body), d = CTFontGetDescent(body), cap = CTFontGetCapHeight(body)
    let firstBaseline = (L - (a + d)) / 2 + a          // CSS half-leading model
    var rest = text
    if let n {
        let (letter, r) = splitFirstLetter(text); rest = r
        // css-inline-3 §7.5.3: capHeight(drop) = (N-1)*L + capHeight(body)
        let ratio = CTFontGetCapHeight(capBase) / CTFontGetSize(capBase)
        let capFont = CTFontCreateCopyWithAttributes(capBase, ((CGFloat(n) - 1) * L + cap) / ratio, nil, nil)
        let capLine = CTLineCreateWithAttributedString(attr(letter, capFont))
        let ink = CTLineGetImageBounds(capLine, nil)   // y-up, relative to pen origin
        let m = sink ?? n
        // §7.6.1: size >= sink -> under-align, shift (sink-1)*L; else over-align (cap line of line 1)
        var capBaseline = CGFloat(n) >= CGFloat(m)
            ? top + firstBaseline + CGFloat(m - 1) * L
            : top + firstBaseline - cap + CTFontGetCapHeight(capFont)
        let capTop = capBaseline - CTFontGetCapHeight(capFont)  // over alignment point = content edge
        if capTop < top { top += top - capTop; capBaseline += top - topIn } // raised cap pushes text down
        out.append(Placed(line: capLine, x: -ink.minX, baseline: capBaseline)) // §7.6.2 kerning
        excl = Exclusion(bottom: capBaseline - ink.minY, right: ink.width + capMarginRight)
    }
    let ts = CTTypesetterCreateWithAttributedString(attr(rest, body))
    let len = (rest as NSString).length                 // UTF-16 indices
    var start = 0, i = 0
    while start < len {
        let lineTop = top + CGFloat(i) * L
        let x = (excl.map { lineTop < $0.bottom } ?? false) ? excl!.right : 0
        let width = Double(W - x)
        let count = CTTypesetterSuggestLineBreak(ts, start, width)
        var line = CTTypesetterCreateLine(ts, CFRange(location: start, length: count))
        start += count
        if start < len { line = CTLineCreateJustifiedLine(line, 1.0, width) ?? line }
        out.append(Placed(line: line, x: x, baseline: lineTop + firstBaseline))
        i += 1
    }
    let bottom = top + CGFloat(i) * L
    if let e = excl, e.bottom <= bottom { excl = nil }  // §7.9.2: else carries into next block
    return bottom
}

let drop = "Đêm đó, trời mưa rất to. Gió rít qua những khe cửa gỗ cũ kỹ, làm ngọn đèn dầu trên bàn chao đảo không ngừng. Bà ngoại ngồi bên bếp lửa, đôi tay gầy guộc chậm rãi khâu lại chiếc áo đã sờn vai của ông. Tôi nằm cuộn tròn trong chăn, lắng nghe tiếng mưa rơi lộp độp trên mái tôn và tiếng ếch nhái kêu râm ran ngoài ruộng lúa. Thỉnh thoảng một tia chớp lóe lên, soi rõ khu vườn ướt sũng với những tàu lá chuối rách tả tơi."
let filler = [
    "Sáng hôm sau, nước đã ngập đến bậc thềm. Mấy đứa trẻ trong xóm rủ nhau ra đầu ngõ thả thuyền giấy, tiếng cười vang cả một khúc đường làng. Mẹ tôi đứng ở hiên nhà, tay cầm chiếc nón lá, nhìn ra cánh đồng trắng xóa mà thở dài.",
    "Người ta bảo năm ấy lũ về sớm hơn mọi năm. Những bao lúa chưa kịp phơi đã bị ướt sũng, mùi ẩm mốc lan khắp gian bếp. Cha tôi lặng lẽ khiêng từng bao lên gác, không nói một lời nào, chỉ có tiếng thở nặng nhọc lẫn trong tiếng mưa.",
    "Chiều xuống, trời bỗng tạnh hẳn. Mặt trời ló ra sau rặng tre, nhuộm vàng cả một vùng nước mênh mông. Tôi ngồi trên bậc cửa, đếm những cánh cò bay về phía chân trời, lòng chợt thấy bình yên đến lạ.",
    "Đêm ấy bà kể cho tôi nghe chuyện ngày xưa, khi bà còn là một cô gái mười bảy tuổi, theo ghe bầu xuôi về phố chợ. Giọng bà trầm và chậm, như dòng sông quê vẫn chảy qua bao mùa nước nổi.",
    "Nhiều năm sau, khi đã đi xa, tôi vẫn còn nhớ mãi tiếng mưa đêm đó, nhớ ánh đèn dầu leo lét và đôi bàn tay gầy của bà.",
]

func layoutPage(_ paras: [String], dropN: Int?, sink: Int? = nil) -> [Placed] {
    var out: [Placed] = []; var excl: Exclusion? = nil; var top: CGFloat = 0
    for (k, p) in paras.enumerated() {
        top = layoutParagraph(p, top: top, n: k == 0 ? dropN : nil, sink: sink, excl: &excl, out: &out)
        if top >= H { break }
    }
    return out.filter { $0.baseline <= H }
}

func render(_ lines: [Placed], guides: [(CGFloat, CGColor)], to name: String) -> CGContext {
    let pw = Int((W + 2 * margin) * scale), ph = Int((H + 2 * margin) * scale)
    let ctx = CGContext(data: nil, width: pw, height: ph, bitsPerComponent: 8, bytesPerRow: 0,
                        space: CGColorSpace(name: CGColorSpace.sRGB)!,
                        bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
    ctx.setFillColor(CGColor(gray: 1, alpha: 1)); ctx.fill(CGRect(x: 0, y: 0, width: pw, height: ph))
    ctx.scaleBy(x: scale, y: scale)
    ctx.textMatrix = .identity
    for l in lines {
        ctx.textPosition = CGPoint(x: margin + l.x, y: H + margin - l.baseline) // page-top -> CG y-up
        CTLineDraw(l.line, ctx)
    }
    for (y, c) in guides {
        ctx.setStrokeColor(c); ctx.setLineWidth(0.5)
        ctx.strokeLineSegments(between: [CGPoint(x: margin - 10, y: H + margin - y), CGPoint(x: margin + 120, y: H + margin - y)])
    }
    let url = URL(fileURLWithPath: "\(outDir)/\(name)") as CFURL
    let dest = CGImageDestinationCreateWithURL(url, "public.png" as CFString, 1, nil)!
    CGImageDestinationAddImage(dest, ctx.makeImage()!, [kCGImagePropertyDPIWidth: 144, kCGImagePropertyDPIHeight: 144] as CFDictionary)
    precondition(CGImageDestinationFinalize(dest))
    return ctx
}

// Ink scan: rows (page-top pt) containing dark pixels in the cap column x in [0, right).
func inkRows(_ ctx: CGContext, right: CGFloat) -> (CGFloat, CGFloat) {
    let p = ctx.data!.assumingMemoryBound(to: UInt8.self), bpr = ctx.bytesPerRow
    var minR = Int.max, maxR = Int.min
    for r in 0..<Int((margin + 85) * scale) { for c in Int(margin * scale)..<Int((margin + right) * scale) where p[r * bpr + c * 4] < 128 {
        minR = min(minR, r); maxR = max(maxR, r) } }
    return (CGFloat(minR) / scale - margin, CGFloat(maxR + 1) / scale - margin) // top edge, bottom edge
}

// ---- 1. Drop-cap page + measurements
let page = layoutPage([drop] + filler + filler + filler, dropN: 3)
let a = CTFontGetAscent(body), d = CTFontGetDescent(body), bodyCap = CTFontGetCapHeight(body)
let base1 = (L - (a + d)) / 2 + a, base3 = base1 + 2 * L, capLine1 = base1 - bodyCap
let capPl = page[0]
let capFont = CTRunGetAttributes((CTLineGetGlyphRuns(capPl.line) as! [CTRun])[0]) as NSDictionary
let cf = capFont[kCTFontAttributeName] as! CTFont
print(String(format: "body 18pt: ascent %.3f descent %.3f cap %.3f; L=%.0f", a, d, bodyCap, L))
print(String(format: "drop font size %.3f (capHeight ratio %.4f), capHeight %.3f",
             CTFontGetSize(cf), CTFontGetCapHeight(cf) / CTFontGetSize(cf), CTFontGetCapHeight(cf)))
print(String(format: "metric: cap top %.3f vs line1 capline %.3f (Δ %.4f); cap baseline %.3f vs line3 baseline %.3f (Δ %.4f)",
             capPl.baseline - CTFontGetCapHeight(cf), capLine1, capPl.baseline - CTFontGetCapHeight(cf) - capLine1,
             capPl.baseline, base3, capPl.baseline - base3))
let ink = CTLineGetImageBounds(capPl.line, nil)
print(String(format: "glyph ink (CTLineGetImageBounds): top %.3f bottom %.3f, width %.3f, lsb %.3f",
             capPl.baseline - ink.maxY, capPl.baseline - ink.minY, ink.width, ink.minX))
for (k, l) in page.prefix(5).enumerated() {
    let w = CTLineGetTypographicBounds(l.line, nil, nil, nil) - CTLineGetTrailingWhitespaceWidth(l.line)
    print(String(format: "line %d x=%.2f baseline=%.2f inkWidth(excl.trailing ws)=%.3f target=%.2f", k, l.x, l.baseline, w, W - l.x))
}
let ctx = render(page, guides: [], to: "dropcap.png")
_ = render(page, guides: [(capLine1, CGColor(red: 1, green: 0, blue: 0, alpha: 1)), (base3, CGColor(red: 0, green: 0, blue: 1, alpha: 1))], to: "dropcap-guides.png")
let (pxTop, pxBottom) = inkRows(ctx, right: ink.width - 1)
print(String(format: "raster (2x px scan of cap column): ink top %.2f (Δ vs capline %.2f), ink bottom %.2f (Δ vs line3 baseline %.2f)",
             pxTop, pxTop - capLine1, pxBottom, pxBottom - base3))

// Short paragraph: exclusion carries into the next block (§7.9.2); and initial-letter 3 2 (sunken), 3 1 (raised)
_ = render(layoutPage(["“Đúng.”", filler[0]], dropN: 3), guides: [], to: "short-para.png")
_ = render(layoutPage([drop], dropN: 3, sink: 2), guides: [], to: "sunk-3-2.png")
_ = render(layoutPage([drop], dropN: 3, sink: 1), guides: [], to: "raised-3-1.png")

// ---- 2. Timing (100 runs, after one warm run)
func time(_ label: String, runs: Int = 100, _ body: () -> Void) {
    let clock = ContinuousClock(); body()
    let t = clock.measure { for _ in 0..<runs { body() } }
    let us = Double(t.components.attoseconds) / 1e12 + Double(t.components.seconds) * 1e6
    print(String(format: "%@: %.1f µs/run", label, us / Double(runs)))
}
let paras = [drop] + filler + filler + filler
let cold = ContinuousClock().measure { _ = layoutPage(Array(filler.reversed()) + [drop], dropN: 3) }
print("first-ever layout of other strings (warm fonts):", cold)
print("text lines on page:", page.count - 1, " last baseline:", page.last!.baseline)
time("FULL layout page 600x900 (attr + typesetter + break + line + justify + dropcap)") { _ = layoutPage(paras, dropN: 3) }
// phase split over exactly the paragraphs/lines that land on the page (full width, no dropcap)
var onPage: [(ts: CTTypesetter, ranges: [CFRange])] = []; var nLines = 0
for p in paras where nLines < 33 {
    let ts = CTTypesetterCreateWithAttributedString(attr(p, body)); var r: [CFRange] = []; var s = 0; let n = (p as NSString).length
    while s < n && nLines < 33 { let c = CTTypesetterSuggestLineBreak(ts, s, 600); r.append(CFRange(location: s, length: c)); s += c; nLines += 1 }
    onPage.append((ts, r))
}
let pageParas = Array(paras.prefix(onPage.count))
print("phase split: \(onPage.count) paragraphs, \(nLines) lines")
time("  attributed string build") { for p in pageParas { _ = attr(p, body) } }
let attrs = pageParas.map { attr($0, body) }
time("  CTTypesetterCreate per paragraph") { for s in attrs { _ = CTTypesetterCreateWithAttributedString(s) } }
let pageAttr = attr(pageParas.joined(separator: "\u{2029}"), body)
time("  CTTypesetterCreate once, page joined by U+2029") { _ = CTTypesetterCreateWithAttributedString(pageAttr) }
time("  SuggestLineBreak (all lines)") { for (ts, rs) in onPage { for r in rs { _ = CTTypesetterSuggestLineBreak(ts, r.location, 600) } } }
time("  CreateLine (all lines)") { for (ts, rs) in onPage { for r in rs { _ = CTTypesetterCreateLine(ts, r) } } }
let made = onPage.flatMap { (ts, rs) in rs.map { CTTypesetterCreateLine(ts, $0) } }
time("  CreateJustifiedLine (all lines)") { for l in made { _ = CTLineCreateJustifiedLine(l, 1, 600) } }
time("  font from bytes (Data→descriptors→CTFont)") { _ = CTFontCreateWithFontDescriptor(loadDescriptor(fontPath), 18, nil) }
time("  CTFontCreateWithFontDescriptor (cached descriptor)") { _ = CTFontCreateWithFontDescriptor(bodyDesc, 18, nil) }
time("  CTFontCreateCopyWithAttributes (new size)") { _ = CTFontCreateCopyWithAttributes(body, 65.5, nil, nil) }
time("render page @2x to bitmap (no PNG encode)", runs: 20) {
    let c = CGContext(data: nil, width: 1360, height: 1960, bitsPerComponent: 8, bytesPerRow: 0, space: CGColorSpace(name: CGColorSpace.sRGB)!, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
    c.scaleBy(x: 2, y: 2); for l in page { c.textPosition = CGPoint(x: 40 + l.x, y: 940 - l.baseline); CTLineDraw(l.line, c) }
}
time("PNG encode 1360x1960", runs: 10) { _ = render(page, guides: [], to: "bench.png") }

// ---- 3. API probes
let probe = CTTypesetterCreateWithAttributedString(attr(filler[0], body))
print("SuggestLineBreak w=300 off=0:", CTTypesetterSuggestLineBreak(probe, 0, 300),
      " off=200:", CTTypesetterSuggestLineBreakWithOffset(probe, 0, 300, 200))
let short = CTTypesetterCreateLine(probe, CFRange(location: 0, length: 20))
func w(_ l: CTLine?) -> String { l.map { String(format: "%.2f", CTLineGetTypographicBounds($0, nil, nil, nil)) } ?? "nil" }
print("justify 20-char line (w \(w(short))) to 600: factor 1 →", w(CTLineCreateJustifiedLine(short, 1, 600)), " factor 0.5 →", w(CTLineCreateJustifiedLine(short, 0.5, 600)))
let nospace = CTLineCreateWithAttributedString(attr("Internationalization", body))
print("justify no-space word (w \(w(nospace))) to 300:", w(CTLineCreateJustifiedLine(nospace, 1, 300)))
let wide = CTTypesetterCreateLine(probe, CFRange(location: 0, length: 60))
print("justify 60-char line (w \(w(wide))) to 200 (squish):", w(CTLineCreateJustifiedLine(wide, 1, 200)))
let en = "The quick brown internationalization characterization"
func hyBreak(_ factor: Float) -> String {
    let ps = NSMutableParagraphStyle(); ps.hyphenationFactor = factor
    let s = NSAttributedString(string: en, attributes: [.font: body as NSFont, .paragraphStyle: ps,
                                                        NSAttributedString.Key(kCTLanguageAttributeName as String): "en"])
    let ts = CTTypesetterCreateWithAttributedString(s); let c = CTTypesetterSuggestLineBreak(ts, 0, 200)
    let l = CTTypesetterCreateLine(ts, CFRange(location: 0, length: c))
    return "\((en as NSString).substring(to: c).debugDescription) glyphs=\(CTLineGetGlyphCount(l))"
}
print("NSParagraphStyle.hyphenationFactor 0 →", hyBreak(0), "| 1 →", hyBreak(1))
let loc = Locale(identifier: "en_US") as CFLocale
var hyChar: UTF32Char = 0
let hloc = CFStringGetHyphenationLocationBeforeIndex(en as CFString, 30, CFRange(location: 16, length: 20), 0, loc, &hyChar)
print("CFStringGetHyphenationLocationBeforeIndex(idx 30 in 'internationalization'):", hloc, (en as NSString).substring(with: NSRange(location: 16, length: hloc - 16)),
      "hyphen U+\(String(hyChar, radix: 16))  available en:", CFStringIsHyphenationAvailableForLocale(loc),
      " vi:", CFStringIsHyphenationAvailableForLocale(Locale(identifier: "vi") as CFLocale))
print("splitFirstLetter:", splitFirstLetter("“Đúng.”"), splitFirstLetter("O\u{31B}\u{309}"))

// ---- 4. Manual justification (expand U+0020 advances) vs CTLineCreateJustifiedLine
struct GlyphRun { let font: CTFont; var glyphs: [CGGlyph]; var pos: [CGPoint] }
func manualJustify(_ line: CTLine, to width: CGFloat, text: NSString) -> [GlyphRun] {
    let natural = CGFloat(CTLineGetTypographicBounds(line, nil, nil, nil) - CTLineGetTrailingWhitespaceWidth(line))
    let r = CTLineGetStringRange(line)
    var end = r.location + r.length; while end > r.location, text.character(at: end - 1) == 0x20 { end -= 1 }
    var spaces = 0; for k in r.location..<end where text.character(at: k) == 0x20 { spaces += 1 }
    let extra = spaces > 0 ? (width - natural) / CGFloat(spaces) : 0
    var out: [GlyphRun] = []; var shift: CGFloat = 0
    for run in CTLineGetGlyphRuns(line) as! [CTRun] { // LTR only
        let n = CTRunGetGlyphCount(run)
        var g = [CGGlyph](repeating: 0, count: n), p = [CGPoint](repeating: .zero, count: n), idx = [CFIndex](repeating: 0, count: n)
        CTRunGetGlyphs(run, CFRange(), &g); CTRunGetPositions(run, CFRange(), &p); CTRunGetStringIndices(run, CFRange(), &idx)
        for k in 0..<n { p[k].x += shift; if idx[k] < end, text.character(at: idx[k]) == 0x20 { shift += extra } }
        out.append(GlyphRun(font: (CTRunGetAttributes(run) as NSDictionary)[kCTFontAttributeName] as! CTFont, glyphs: g, pos: p))
    }
    return out
}
let jtexts = onPage.indices.map { pageParas[$0] as NSString }
let jlines = onPage.enumerated().flatMap { (i, e) in e.ranges.map { (CTTypesetterCreateLine(e.ts, $0), i) } }
time("  manual justify positions (all lines)") { for (l, i) in jlines { _ = manualJustify(l, to: 600, text: jtexts[i]) } }
let m = manualJustify(jlines[0].0, to: 600, text: jtexts[0])
let j = CTLineCreateJustifiedLine(jlines[0].0, 1, 600)!
var jp = [CGPoint](repeating: .zero, count: CTLineGetGlyphCount(j)); var o = 0
for run in CTLineGetGlyphRuns(j) as! [CTRun] { let n = CTRunGetGlyphCount(run); jp.withUnsafeMutableBufferPointer { CTRunGetPositions(run, CFRange(), $0.baseAddress! + o) }; o += n }
let mp = m.flatMap(\.pos)
print("manual vs CT justified line 0: last glyph x", mp.last!.x, "vs", jp.last!.x, " max |Δx|", zip(mp, jp).map { abs($0.x - $1.x) }.max()!)

// ---- 5. Positive control: same string/width through TextKit 1 (which honors hyphenationFactor)
let tkps = NSMutableParagraphStyle(); tkps.hyphenationFactor = 1
let storage = NSTextStorage(string: en, attributes: [.font: body as NSFont, .paragraphStyle: tkps])
let lm = NSLayoutManager(); let tc = NSTextContainer(size: CGSize(width: 200, height: 1000)); tc.lineFragmentPadding = 0
lm.addTextContainer(tc); storage.addLayoutManager(lm)
var lr = NSRange(); _ = lm.lineFragmentRect(forGlyphAt: 0, effectiveRange: &lr)
print("TextKit1 hyphenationFactor=1 first line chars:", (en as NSString).substring(with: lm.characterRange(forGlyphRange: lr, actualGlyphRange: nil)).debugDescription)
