import CoReaderEngine
import CoreGraphics
import CoreText
import Foundation

let usage = """
usage:
  coreader fonts <dir>
  coreader book <epub>                      (JSON: metadata, spine, toc, openMs; exit 2 if refused)
  coreader render <xhtml> --out <png> [--check] [--geometry <json>] [--cap-color red] [--clip <pt>]
  coreader paginate <xhtml> --out-dir <dir> [--check] [--expect-push]
  coreader verify-resume <xhtml> --pages <pages.json> --lines <lines.json>
  coreader compare <ours.png> <ours.json> <wk.png> <wk.json> --out <side.png> --row <row.json> --name <case> --kind <flat|diacritic>
  coreader bench <xhtml> --pages <pages.json> [--cold]
  coreader styles <xhtml> --out <json>       (computed style of every body element)
  coreader compare-styles <ours.json> <webkit.json> [--out <diff.json>]
  coreader css-report <epub>                 (JSON: per CSS file, what the cascade ignores)
Chapter input: <xhtml> (its linked CSS from disk) or --epub <file> --spine <N> (chapter, CSS and fonts from the ZIP).
Styling: [--user-css <file>]... (user origin, in order) [--no-book-css]
"""

struct CLIError: Error, CustomStringConvertible { let description: String }

struct Args {
    var positional: [String] = []
    var options: [String: String] = [:]
    /// Every value of a repeatable option, in order.
    var lists: [String: [String]] = [:]
    var flags: Set<String> = []
    static let flagNames: Set<String> = ["--check", "--cold", "--expect-push", "--no-book-css"]

    init(_ raw: ArraySlice<String>) {
        var it = raw.makeIterator()
        while let a = it.next() {
            if Self.flagNames.contains(a) { flags.insert(a) }
            else if a.hasPrefix("--") { let v = it.next() ?? ""; options[a] = v; lists[a, default: []].append(v) }
            else { positional.append(a) }
        }
    }

    func required(_ name: String) throws -> String {
        guard let v = options[name] else { throw CLIError(description: "missing \(name)\n\(usage)") }
        return v
    }

    func input(_ k: Int) throws -> String {
        guard positional.count > k else { throw CLIError(description: usage) }
        return positional[k]
    }
}

let geometry = PageGeometry()

/// Parse + cascade setup for the chapter named by the arguments; also its path and resource loader.
func loadStyled(_ a: Args) throws -> (Document, Styler, String, @Sendable (String) throws -> Data) {
    let doc: Document
    let path: String
    let load: @Sendable (String) throws -> Data
    if let epub = a.options["--epub"] {
        let book = try Book(url: URL(fileURLWithPath: epub))
        guard let n = Int(try a.required("--spine")), book.spine.indices.contains(n) else { throw CLIError(description: "bad --spine") }
        path = book.spine[n].path
        load = { try book.data($0) }
    } else {
        path = URL(fileURLWithPath: try a.input(0)).standardizedFileURL.path
        load = { try Data(contentsOf: URL(fileURLWithPath: $0)) }
    }
    doc = try Document(data: load(path))
    let readFile: @Sendable (String) throws -> Data = { try Data(contentsOf: URL(fileURLWithPath: $0)) }
    var sources = try (a.lists["--user-css"] ?? []).map { file in
        let p = URL(fileURLWithPath: file).standardizedFileURL.path
        return StyleSource(sheet: Stylesheet(String(decoding: try readFile(p), as: UTF8.self), base: p), origin: .user, load: readFile)
    }
    if !a.flags.contains("--no-book-css") { sources += try Styler.bookSources(doc, path: path, load: load) }
    return (doc, Styler(sources: sources), path, load)
}

/// Parse + style + fonts → chapter (the whole "open" path).
func loadChapter(_ a: Args) throws -> Chapter {
    let (doc, styler, path, load) = try loadStyled(a)
    return try Chapter(document: doc, styler: styler, columnWidth: geometry.columnWidth, columnHeight: geometry.columnHeight,
                       path: path, load: load)
}

/// Stylesheet diagnostics for every CSS file in an EPUB: what the profile cascade ignores (§9).
func cssReport(_ a: Args) throws {
    let book = try Book(url: URL(fileURLWithPath: try a.input(0)))
    struct Row: Encodable { var path: String; var rules: Int; var fontFaces: Int; var ignoredAtRules: [String: Int]; var invalidSelectors: [String]; var unknownProperties: [String: Int] }
    var rows: [Row] = []
    for item in book.manifest where item.mediaType == "text/css" {
        let sheet = Stylesheet(String(decoding: try book.data(item.path), as: UTF8.self), base: item.path)
        var unknown: [String: Int] = [:]
        for r in sheet.rules { for d in r.declarations where !Styler.knownProperties.contains(d.name) { unknown[d.name, default: 0] += 1 } }
        rows.append(Row(path: item.path, rules: sheet.rules.count, fontFaces: sheet.fontFaces.count, ignoredAtRules: sheet.ignoredAtRules,
                        invalidSelectors: sheet.invalidSelectors, unknownProperties: unknown))
    }
    let enc = JSONEncoder()
    enc.outputFormatting = [.sortedKeys, .prettyPrinted, .withoutEscapingSlashes]
    print(String(decoding: try enc.encode(rows), as: UTF8.self))
}

// MARK: styles (computed-style dump, same fields as `webref --styles`)

struct StyleRow: Codable, Equatable {
    var tag, family: String
    var fontSize: Double
    var weight: Int
    var italic: Bool
    var lineHeight: Double?
    var align, display, verticalAlign: String
    var indent, marginTop, marginRight, marginBottom, marginLeft: Double
    /// Ours only: PostScript name of the resolved font (not compared).
    var font: String?
}

func styles(_ a: Args) throws {
    let (doc, styler, _, _) = try loadStyled(a)
    var rows: [StyleRow] = []
    func visit(_ i: Int, _ s: ComputedStyle, width: CGFloat) {
        let lh: Double? = if case .normal = s.lineHeight { nil } else { Double(s.lineHeightPt) }
        rows.append(StyleRow(tag: doc.nodes[i].tag, family: s.families.first ?? "", fontSize: s.fontSize, weight: s.weight,
                             italic: s.italic, lineHeight: lh, align: "\(s.align)", display: "\(s.display)",
                             verticalAlign: ["baseline": "baseline", "superscript": "super", "subscript": "sub"]["\(s.verticalAlign)"]!,
                             indent: s.indent, marginTop: s.marginTop, marginRight: s.marginRight,
                             marginBottom: s.marginBottom, marginLeft: s.marginLeft,
                             font: (try? styler.fonts.font(families: s.families, weight: s.weight, italic: s.italic, size: s.fontSize))
                                .map { CTFontCopyPostScriptName($0) as String }))
        let inner = s.display == .block ? width - s.marginLeft - s.marginRight : width
        for c in doc.children(i) where doc.nodes[c].kind == .element {
            visit(c, styler.compute(c, in: doc, parent: s, width: inner), width: inner)
        }
    }
    visit(doc.body, styler.root(doc, width: geometry.columnWidth), width: geometry.columnWidth)
    try writeJSON(rows, to: try a.required("--out"))
}

/// Field-by-field diff of two style dumps (numbers within 0.02 px). Exit 1 on any mismatch.
func compareStyles(_ a: Args) throws {
    let ours = try JSONDecoder().decode([StyleRow].self, from: Data(contentsOf: URL(fileURLWithPath: try a.input(0))))
    let wk = try JSONDecoder().decode([StyleRow].self, from: Data(contentsOf: URL(fileURLWithPath: try a.input(1))))
    guard ours.count == wk.count else { throw CLIError(description: "element count \(ours.count) ≠ \(wk.count)") }
    var diffs: [String] = []
    func num(_ x: Double?, _ y: Double?) -> Bool { x == nil && y == nil || (x != nil && y != nil && abs(x! - y!) <= 0.02) }
    for (k, (o, w)) in zip(ours, wk).enumerated() {
        guard o.tag == w.tag else { throw CLIError(description: "element \(k): <\(o.tag)> vs <\(w.tag)>") }
        var f: [String] = []
        if o.family.lowercased() != w.family.lowercased() { f.append("family \(o.family) ≠ \(w.family)") }
        if !num(o.fontSize, w.fontSize) { f.append("fontSize \(o.fontSize) ≠ \(w.fontSize)") }
        if o.weight != w.weight { f.append("weight \(o.weight) ≠ \(w.weight)") }
        if o.italic != w.italic { f.append("italic \(o.italic) ≠ \(w.italic)") }
        if !num(o.lineHeight, w.lineHeight) { f.append("lineHeight \(o.lineHeight.map { "\($0)" } ?? "normal") ≠ \(w.lineHeight.map { "\($0)" } ?? "normal")") }
        if o.align != w.align { f.append("align \(o.align) ≠ \(w.align)") }
        if o.display != w.display { f.append("display \(o.display) ≠ \(w.display)") }
        if o.verticalAlign != w.verticalAlign { f.append("verticalAlign \(o.verticalAlign) ≠ \(w.verticalAlign)") }
        for (name, x, y) in [("indent", o.indent, w.indent), ("marginTop", o.marginTop, w.marginTop), ("marginRight", o.marginRight, w.marginRight),
                             ("marginBottom", o.marginBottom, w.marginBottom), ("marginLeft", o.marginLeft, w.marginLeft)] where !num(x, y) {
            f.append("\(name) \(x) ≠ \(y)")
        }
        if !f.isEmpty { diffs.append("#\(k) <\(o.tag)>: " + f.joined(separator: "; ")) }
    }
    if let out = a.options["--out"] { try writeJSON(diffs, to: out) }
    print("\(ours.count) elements, \(diffs.count) with differences")
    for d in diffs.prefix(20) { print("  " + d) }
    if !diffs.isEmpty { exit(1) }
}

struct BookSummary: Encodable {
    var title, language, identifier, version, opf, nav: String
    var creator, cover: String?
    var spine: [String]
    var toc: [Book.TOCEntry]
    var openMs: Double
}

func bookCommand(_ a: Args) throws {
    let path = try a.input(0)
    let t0 = DispatchTime.now().uptimeNanoseconds
    let book: Book
    do { book = try Book(url: URL(fileURLWithPath: path)) } catch let e as BookError {
        print("refused: \(e)")
        exit(2)
    }
    let ms = Double(DispatchTime.now().uptimeNanoseconds - t0) / 1e6
    let s = BookSummary(title: book.title, language: book.language, identifier: book.identifier, version: book.version,
                        opf: book.opfPath, nav: book.navPath, creator: book.creator, cover: book.coverPath,
                        spine: book.spine.map(\.path), toc: book.toc, openMs: ms)
    let enc = JSONEncoder()
    enc.outputFormatting = [.sortedKeys, .prettyPrinted, .withoutEscapingSlashes]
    print(String(decoding: try enc.encode(s), as: UTF8.self))
}

func text(_ chapter: Chapter, _ l: PlacedLine) -> NSString {
    l.kind == .note ? chapter.notes[l.source].block.text : chapter.blocks[l.source].text
}

/// Justified lines fill their width; last lines are never stretched.
func checkJustification(_ chapter: Chapter, _ lines: [PlacedLine], _ failures: inout [String]) {
    for l in lines where l.kind != .cap {
        let b = l.kind == .note ? chapter.notes[l.source].block : chapter.blocks[l.source]
        let isLast = l.location + l.length >= b.length
        if l.spaceExtra != 0 {
            if isLast { failures.append("last line stretched: \(l.kind) \(l.source) @\(l.location)") }
            let w = l.drawnWidth(text: b.text)
            if abs(w - l.width) > 0.01 {
                failures.append(String(format: "justified width %.3f ≠ %.3f: %@ %d @%d", w, l.width, l.kind.rawValue, l.source, l.location))
            }
        }
    }
}

func writeJSON<T: Encodable>(_ value: T, to path: String) throws {
    let enc = JSONEncoder()
    enc.outputFormatting = [.sortedKeys]
    let url = URL(fileURLWithPath: path)
    try FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
    try enc.encode(value).write(to: url)
}

// MARK: render (tall column)

struct Geometry: Codable {
    struct Ink: Codable { var minX, minY, maxX, maxY: Double }
    struct Box: Codable { var minX, maxX: Double }
    struct Line: Codable { var top: Double; var baseline: Double?; var left: Double }
    var capInk: Ink?
    var capBox: Box?
    var lines: [Line]
    /// Ours only: line 1's cap line and the cap's baseline (comparison guides).
    var guides: [Double]?
}

func render(_ a: Args) throws {
    let chapter = try loadChapter(a)
    let lines = LineLayout(chapter: chapter).tallColumn()
    let m = geometry.margin
    var height = (lines.map(\.bottom).max() ?? 0) + 2 * m
    if let clip = a.options["--clip"].flatMap(Double.init) { height = min(height, clip) }
    let canvas = Canvas(width: geometry.width, height: height, scale: geometry.scale)
    let capColor = a.options["--cap-color"] == "red" ? CGColor(srgbRed: 1, green: 0, blue: 0, alpha: 1) : nil
    canvas.draw(lines, chapter: chapter, origin: CGPoint(x: m, y: m), capColor: capColor)
    try canvas.writePNG(to: URL(fileURLWithPath: try a.required("--out")))

    if let path = a.options["--geometry"] {
        var g = Geometry(lines: [])
        if let capIndex = lines.firstIndex(where: { $0.kind == .cap }) {
            let cap = lines[capIndex], dc = chapter.blocks[cap.source].dropCap!
            g.capInk = .init(minX: m + cap.x + dc.ink.minX, minY: m + cap.baseline - dc.ink.maxY,
                             maxX: m + cap.x + dc.ink.maxX, maxY: m + cap.baseline - dc.ink.minY)
            g.capBox = .init(minX: m + cap.x, maxX: m + cap.x + dc.advance)
            let body = lines[(capIndex + 1)...].filter { $0.kind == .body && m + $0.top < height }
            g.lines = body.map { .init(top: m + $0.baseline - $0.ascent, baseline: m + $0.baseline, left: m + $0.x) }
            if let first = body.first {
                g.guides = [m + first.baseline - chapter.blocks[cap.source].capHeight, m + cap.baseline]
            }
        }
        try writeJSON(g, to: path)
    }

    if a.flags.contains("--check") {
        var failures: [String] = []
        checkJustification(chapter, lines, &failures)
        if !failures.isEmpty { throw CLIError(description: "CHECK FAILED\n" + failures.joined(separator: "\n")) }
        print("check OK: \(lines.count) lines, \(lines.filter { $0.spaceExtra != 0 }.count) justified")
    }
}

// MARK: paginate

struct LineRecord: Codable, Equatable {
    var kind: LineKind
    var source: Int
    var location: Int
    var length: Int
    var x: Double
    var baseline: Double

    init(_ l: PlacedLine) {
        kind = l.kind; source = l.source; location = l.location; length = l.length
        x = Double(l.x); baseline = Double(l.baseline)
    }

    func matches(_ o: LineRecord) -> Bool {
        kind == o.kind && source == o.source && location == o.location && length == o.length
            && abs(x - o.x) <= 0.001 && abs(baseline - o.baseline) <= 0.001
    }
}

func drawPage(_ page: Page, number: Int, total: Int, chapter: Chapter) -> Canvas {
    let m = geometry.margin
    let canvas = Canvas(width: geometry.width, height: geometry.height, scale: geometry.scale)
    let origin = CGPoint(x: m, y: m)
    canvas.draw(page.lines, chapter: chapter, origin: origin)
    if let top = page.separatorTop {
        canvas.drawSeparator(slotTop: top, slotHeight: chapter.noteLineHeight, columnWidth: chapter.columnWidth, origin: origin)
    }
    let footer = CTFontCreateWithName("Times New Roman" as CFString, 10, nil)
    canvas.drawCentered("\(number) / \(total)", font: footer, centerX: geometry.width / 2, baseline: geometry.height - m / 2)
    return canvas
}

func paginate(_ a: Args) throws {
    let chapter = try loadChapter(a)
    let paginator = Paginator(chapter: chapter, height: geometry.columnHeight)
    let pages = paginator.paginate()
    let dir = try a.required("--out-dir")
    try FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true)
    for (k, page) in pages.enumerated() {
        try drawPage(page, number: k + 1, total: pages.count, chapter: chapter)
            .writePNG(to: URL(fileURLWithPath: dir).appendingPathComponent(String(format: "page-%03d.png", k + 1)))
    }
    try writeJSON(pages.map(\.start), to: "\(dir)/pages.json")
    try writeJSON(pages.map { $0.lines.map(LineRecord.init) }, to: "\(dir)/lines.json")
    print("\(pages.count) pages, \(chapter.notes.count) notes → \(dir)")

    guard a.flags.contains("--check") else { return }
    var failures: [String] = []
    let eps = 0.001

    // Notes: count from the XHTML, each placed once, contiguous, in first-ref order.
    if chapter.notes.count != chapter.footnoteCount {
        failures.append("\(chapter.footnoteCount) footnotes in XHTML, \(chapter.notes.count) referenced")
    }
    var nextOffset = [Int](repeating: 0, count: chapter.notes.count)
    var order: [Int] = []
    var notePage = [Int: Int]()
    var noteLinesOnFirstPage = [Int: Int]()
    for (k, page) in pages.enumerated() {
        checkJustification(chapter, page.lines, &failures)
        let body = page.lines.filter { $0.kind != .note }
        let notes = page.lines.filter { $0.kind == .note }
        if k < pages.count - 1, body.isEmpty, notes.isEmpty { failures.append("page \(k + 1) is empty") }
        if let sep = page.separatorTop, let worst = body.filter({ $0.kind == .body }).map(\.bottom).max(), worst > sep + eps {
            failures.append("page \(k + 1): body line overlaps the note area (\(worst) > \(sep))")
        }
        for l in notes {
            if nextOffset[l.source] != l.location { failures.append("note \(l.source + 1): gap or repeat at \(l.location) on page \(k + 1)") }
            nextOffset[l.source] = l.location + l.length
            if notePage[l.source] == nil { notePage[l.source] = k; order.append(l.source) }
            if notePage[l.source] == k { noteLinesOnFirstPage[l.source, default: 0] += 1 }
        }
    }
    for (n, note) in chapter.notes.enumerated() where nextOffset[n] != note.block.length {
        failures.append("note \(n + 1) incomplete: \(nextOffset[n]) of \(note.block.length)")
    }
    if order != Array(order.indices) { failures.append("notes out of first-ref order: \(order)") }

    // §8 page rules. Body lines per page, caps aside.
    let bodies = pages.map { $0.lines.filter { $0.kind == .body || $0.kind == .image } }
    for (k, p) in pages.enumerated() where p.lines.isEmpty && !chapter.blocks.isEmpty { failures.append("page \(k + 1) is blank") }
    for k in 0..<max(0, pages.count - 1) {
        guard let last = bodies[k].last, let first = bodies[k + 1].first else { continue }
        let onlyLast = bodies[k].allSatisfy { $0.source == last.source }
        if last.source == first.source {
            // Widows/orphans: 2 lines on each side, unless one side is a whole page of that block.
            let before = bodies[k].filter { $0.source == last.source }.count
            let after = bodies[k + 1].filter { $0.source == first.source }.count
            let endsThere = bodies[k + 1].last!.source != first.source || k + 1 == pages.count - 1
            if before < 2 && !onlyLast { failures.append("page \(k + 1): orphan (1 line of block \(last.source))") }
            if after < 2 && endsThere && !(onlyLast && before < 3) { failures.append("page \(k + 2): widow (1 line of block \(first.source))") }
        }
        if chapter.blocks[last.source].keepWithNext && last.source != first.source && !onlyLast {
            failures.append("page \(k + 1) ends with a heading")
        }
    }
    for (b, block) in chapter.blocks.enumerated() where block.breakBefore && b > 0 {
        if !bodies.contains(where: { $0.first?.source == b && $0.first?.location == 0 }) { failures.append("block \(b): break-before not at a page top") }
    }

    // Each note starts on the page of its first ref with min(2, lines) lines, unless its ref line opens the page.
    for r in chapter.refs {
        // Lines of a block are contiguous: the first one ending after the ref holds it.
        guard let refPage = pages.firstIndex(where: { p in
            p.lines.contains { $0.kind == .body && $0.source == r.block && r.offset < $0.location + $0.length }
        }) else { failures.append("ref of note \(r.note + 1) not placed"); continue }
        if notePage[r.note] != refPage { failures.append("note \(r.note + 1) starts on page \((notePage[r.note] ?? -1) + 1), ref on page \(refPage + 1)"); continue }
        let total = chapter.notes[r.note].lineStarts(width: chapter.columnWidth).count
        let firstBody = pages[refPage].lines.first { $0.kind == .body }!
        let opensPage = firstBody.source == r.block && r.offset < firstBody.location + firstBody.length
        if (noteLinesOnFirstPage[r.note] ?? 0) < min(2, total) && !opensPage {
            failures.append("note \(r.note + 1) gets \(noteLinesOnFirstPage[r.note] ?? 0) line(s) on its ref page \(refPage + 1)")
        }
    }

    // footnote-push: the first ref's line would fit on page 1 alone, yet moves to page 2 because its note cannot
    // (with widows/orphans it may take more of its paragraph along, so it need not open the page).
    if a.flags.contains("--expect-push") {
        let r = chapter.refs[0]
        let holds = { (l: PlacedLine) in l.kind == .body && l.source == r.block && r.offset < l.location + l.length }
        let tallLine = paginator.layout.tallColumn().first(where: holds)!
        let onPage2 = pages.count > 1 && pages[1].lines.contains { holds($0) && $0.location == tallLine.location }
        if !(tallLine.bottom <= geometry.columnHeight && onPage2) {
            failures.append("expected the ref line (bottom \(tallLine.bottom) on its own) to be pushed to page 2")
        }
    }

    // (a) Continuity against the tall column, independent of the paginator.
    let tall = paginator.layout.tallColumn().filter { $0.kind == .body }
    var paged: [(line: PlacedLine, page: Int)] = []
    for (k, p) in pages.enumerated() { paged += p.lines.filter { $0.kind == .body }.map { ($0, k) } }
    let tallByBlock = Dictionary(grouping: tall, by: \.source)
    let pagedByBlock = Dictionary(grouping: paged, by: \.line.source)
    var compared = 0
    for b in 0..<chapter.blocks.count {
        let t = tallByBlock[b] ?? [], p = pagedByBlock[b] ?? []
        for i in 0..<max(t.count, p.count) {
            guard i < t.count, i < p.count else { failures.append("block \(b): \(t.count) tall lines vs \(p.count) paged"); break }
            if t[i].location == p[i].line.location && t[i].length == p[i].line.length { compared += 1; continue }
            // A cap exclusion is dropped at a page break: lines it narrows compare only on the cap's own page.
            if t[i].excluded && !p[i].line.excluded { break }
            failures.append("block \(b) line \(i): tall \(t[i].location)+\(t[i].length) vs paged \(p[i].line.location)+\(p[i].line.length) on page \(p[i].page + 1)")
            break
        }
    }
    if !failures.isEmpty { throw CLIError(description: "CHECK FAILED\n" + failures.joined(separator: "\n")) }
    print("check OK: \(pages.count) pages, \(chapter.notes.count)/\(chapter.footnoteCount) notes, \(compared) body lines match the tall column")
}

// MARK: verify-resume (separate process)

func verifyResume(_ a: Args) throws {
    let starts = try JSONDecoder().decode([PageStart].self, from: Data(contentsOf: URL(fileURLWithPath: try a.required("--pages"))))
    let expected = try JSONDecoder().decode([[LineRecord]].self, from: Data(contentsOf: URL(fileURLWithPath: try a.required("--lines"))))
    guard starts.count == expected.count else { throw CLIError(description: "FAIL: \(starts.count) starts vs \(expected.count) pages") }
    for (k, start) in starts.enumerated() {
        // A new chapter (parse, style, fonts) per page: nothing survives from page k−1.
        let chapter = try loadChapter(a)
        let (page, next) = Paginator(chapter: chapter, height: geometry.columnHeight).layoutPage(from: start)
        let got = page.lines.map(LineRecord.init)
        if got.count != expected[k].count {
            throw CLIError(description: "FAIL page \(k + 1): \(got.count) lines vs \(expected[k].count)")
        }
        if let i = got.indices.first(where: { !got[$0].matches(expected[k][$0]) }) {
            throw CLIError(description: "FAIL page \(k + 1) line \(i): \(got[i]) vs \(expected[k][i])")
        }
        if next != (k + 1 < starts.count ? starts[k + 1] : nil) {
            throw CLIError(description: "FAIL page \(k + 1): next start \(String(describing: next)) vs \(k + 1 < starts.count ? "\(starts[k + 1])" : "end")")
        }
    }
    print("PASS: \(starts.count) pages rebuilt from pages.json")
}

// MARK: bench

func bench(_ a: Args) throws {
    let clock = ContinuousClock()
    let t0 = clock.now
    let starts = try JSONDecoder().decode([PageStart].self, from: Data(contentsOf: URL(fileURLWithPath: try a.required("--pages"))))
    func ms(_ d: Duration) -> Double { Double(d.components.seconds) * 1000 + Double(d.components.attoseconds) / 1e15 }
    if a.flags.contains("--cold") {
        let chapter = try loadChapter(a)
        let mid = starts[starts.count / 2]
        let (page, _) = Paginator(chapter: chapter, height: geometry.columnHeight).layoutPage(from: mid)
        _ = drawPage(page, number: starts.count / 2 + 1, total: starts.count, chapter: chapter).image()
        print(String(format: "{\"reopenMs\": %.3f}", ms(clock.now - t0)))
        return
    }
    let chapter = try loadChapter(a)
    let paginator = Paginator(chapter: chapter, height: geometry.columnHeight)
    func run() { for (k, s) in starts.enumerated() { _ = drawPage(paginator.layoutPage(from: s).page, number: k + 1, total: starts.count, chapter: chapter).image() } }
    run() // warm-up
    let t = clock.measure(run)
    print(String(format: "{\"pageMeanMs\": %.3f, \"pages\": %d}", ms(t) / Double(starts.count), starts.count))
}

// MARK: main

do {
    let argv = CommandLine.arguments
    guard argv.count > 1 else { throw CLIError(description: usage) }
    let a = Args(argv.dropFirst(2))
    switch argv[1] {
    case "book": try bookCommand(a)
    case "fonts":
        let dir = URL(fileURLWithPath: try a.input(0))
        for f in try FileManager.default.contentsOfDirectory(atPath: dir.path).sorted() where [".ttf", ".otf"].contains(where: f.lowercased().hasSuffix) {
            for line in try FontBook.describe(dir.appendingPathComponent(f)) { print(line) }
        }
    case "render": try render(a)
    case "paginate": try paginate(a)
    case "verify-resume": try verifyResume(a)
    case "compare": try compare(a)
    case "styles": try styles(a)
    case "css-report": try cssReport(a)
    case "compare-styles": try compareStyles(a)
    case "bench": try bench(a)
    default: throw CLIError(description: usage)
    }
} catch {
    FileHandle.standardError.write(Data("\(error)\n".utf8))
    exit(1)
}
