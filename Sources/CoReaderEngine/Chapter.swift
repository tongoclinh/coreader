import ImageIO
import CoreText
import Foundation

/// Custom attribute: baseline raise in pt for `vertical-align: super` (applied at draw time).
let raiseAttribute = NSAttributedString.Key("CoReaderRaise")
/// Custom attribute: `href` of an `a` element (not noterefs).
let linkAttribute = NSAttributedString.Key("CoReaderLink")
/// Custom attribute: `ImageRef` of an inline image (U+FFFC with a run delegate).
let imageAttribute = NSAttributedString.Key("CoReaderImage")
let fontAttribute = NSAttributedString.Key(kCTFontAttributeName as String)
let languageAttribute = NSAttributedString.Key(kCTLanguageAttributeName as String)

/// An image of the chapter: its resource path and display size in pt.
public final class ImageRef {
    public let path: String
    public let size: CGSize
    init(path: String, size: CGSize) { self.path = path; self.size = size }
}

/// Start of the content of an element with an `id`.
public struct Anchor: Sendable, Equatable {
    public let block: Int
    public let offset: Int
}

/// An `initial-letter` drop cap (css-inline-3 §7).
public struct DropCap {
    public let rule: DropCapRule
    /// UTF-16 length of the first letter (leading punctuation + one grapheme) at the start of the block.
    public let length: Int
    public let line: CTLine
    public let font: CTFont
    public let capHeight: CGFloat
    /// Advance width (`CTLineGetTypographicBounds`).
    public let advance: CGFloat
    /// Ink bounds, y-up relative to the pen (`CTLineGetImageBounds`).
    public let ink: CGRect
}

/// One block of inline content laid out as lines (a paragraph, a heading, an anonymous block, or a note).
public final class TextBlock {
    public let string: NSAttributedString
    public let text: NSString
    public var length: Int { text.length }
    /// Collapsed margins (plus any `hr` gap) above the block.
    public let spaceBefore: CGFloat
    public let insetLeft: CGFloat
    public let insetRight: CGFloat
    public let indent: CGFloat
    public let align: TextAlign
    public let lineHeight: CGFloat
    /// Baseline below the line-box top: CSS half-leading model `(LH − (asc+desc))/2 + asc`.
    public let baselineOffset: CGFloat
    public let ascent: CGFloat
    public let capHeight: CGFloat
    public let dropCap: DropCap?
    /// Block image (§4.2): the block is one U+FFFC and its only line is the image box.
    public let image: ImageRef?
    /// `break-before: page` on the block or an element it starts.
    public let breakBefore: Bool
    /// Heading content: never the last block on a page (§8).
    public let keepWithNext: Bool
    public private(set) lazy var typesetter: CTTypesetter = CTTypesetterCreateWithAttributedString(string)

    init(string: NSAttributedString, spaceBefore: CGFloat, insetLeft: CGFloat, insetRight: CGFloat,
         style: ComputedStyle, font: CTFont, dropCap: DropCap?, image: ImageRef? = nil,
         breakBefore: Bool = false, keepWithNext: Bool = false) {
        self.string = string
        self.text = string.string as NSString
        self.spaceBefore = spaceBefore
        self.insetLeft = insetLeft
        self.insetRight = insetRight
        self.indent = image == nil ? style.indent : 0
        self.align = style.align
        self.lineHeight = image?.size.height ?? style.lineHeightPt
        let a = CTFontGetAscent(font), d = CTFontGetDescent(font)
        self.ascent = a
        self.baselineOffset = (lineHeight - (a + d)) / 2 + a
        self.capHeight = CTFontGetCapHeight(font)
        self.dropCap = dropCap
        self.image = image
        self.breakBefore = breakBefore
        self.keepWithNext = keepWithNext
    }
}

/// A footnote: `MARK` + U+0020 + its blocks joined by U+2029, in the note style (0.8 × body size).
public final class Note {
    public let id: String
    public let mark: String
    public let block: TextBlock
    private var starts: [Int]?

    init(id: String, mark: String, block: TextBlock) {
        self.id = id; self.mark = mark; self.block = block
    }

    /// UTF-16 offsets where the note's lines start at `width`.
    public func lineStarts(width: CGFloat) -> [Int] {
        if let s = starts { return s }
        var s: [Int] = []
        var at = 0
        while at < block.length {
            s.append(at)
            at += max(1, CTTypesetterSuggestLineBreak(block.typesetter, at, Double(width)))
        }
        starts = s
        return s
    }
}

/// First reference to a note, fixed at parse time.
public struct NoteRef: Sendable {
    public let block: Int
    public let offset: Int
    public let note: Int
}

/// One spine document turned into blocks and footnotes.
public final class Chapter {
    public let blocks: [TextBlock]
    /// Notes in first-ref order.
    public let notes: [Note]
    /// First refs, in document order (same order as `notes`).
    public let refs: [NoteRef]
    /// Number of `aside[epub:type=footnote]` elements in the document.
    public let footnoteCount: Int
    public let columnWidth: CGFloat
    /// Body (root) line height, used for the note-area cap.
    public let bodyLineHeight: CGFloat
    public let noteLineHeight: CGFloat
    /// Element `id` → where its content starts (fragment navigation).
    public let anchors: [String: Anchor]
    private let load: (@Sendable (String) throws -> Data)?
    private var decoded: [ObjectIdentifier: (scale: CGFloat, image: CGImage)] = [:]

    /// `path`: the document's resource path; `load` reads the images it references. `columnHeight` caps block images.
    public init(document doc: Document, styler: Styler, columnWidth: CGFloat, columnHeight: CGFloat,
                path: String = "", load: (@Sendable (String) throws -> Data)? = nil) throws {
        var b = Builder(doc: doc, styler: styler, path: path, load: load, columnWidth: columnWidth, columnHeight: columnHeight)
        let root = styler.root(doc, width: columnWidth)
        // §5 notes: footnote asides referenced from this document. Others stay in the flow (§9).
        let referenced = Set(doc.nodes.indices.filter { doc.nodes[$0].kind == .element && doc.isNoteref($0) }
            .compactMap { doc.nodes[$0].href }.filter { $0.hasPrefix("#") }.map { String($0.dropFirst()) })
        for i in 0..<doc.nodes.count where doc.nodes[i].kind == .element && doc.isFootnote(i) {
            if let id = doc.nodes[i].id, referenced.contains(id) { b.asides[id] = i }
        }
        try b.walkBlock(doc.body, root, width: columnWidth, insetLeft: 0, insetRight: 0, isRoot: true)
        for id in b.pendingAnchors { b.anchors[id] = Anchor(block: b.blocks.count, offset: 0) }

        // Notes in first-ref order.
        var noteIndex: [String: Int] = [:]
        var notes: [Note] = []
        var refs: [NoteRef] = []
        var noteStyle = root
        noteStyle.fontSize = root.fontSize * 0.8
        noteStyle.indent = 0
        for r in b.refs where noteIndex[r.id] == nil {
            guard let aside = b.asides[r.id] else { continue }
            noteIndex[r.id] = notes.count
            refs.append(NoteRef(block: r.block, offset: r.offset, note: notes.count))
            notes.append(try b.note(id: r.id, mark: r.mark, aside: aside, style: noteStyle, width: columnWidth))
        }
        self.blocks = b.blocks
        self.notes = notes
        self.refs = refs
        self.footnoteCount = b.asides.count
        self.columnWidth = columnWidth
        self.bodyLineHeight = root.lineHeightPt
        self.noteLineHeight = noteStyle.lineHeightPt
        self.anchors = b.anchors
        self.load = load
    }

    /// `ref` decoded at its display size × `scale` (ImageIO thumbnail), cached for the chapter.
    public func image(_ ref: ImageRef, scale: CGFloat) -> CGImage? {
        if let d = decoded[ObjectIdentifier(ref)], d.scale == scale { return d.image }
        guard let data = try? load?(ref.path), let src = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }
        let opts: [CFString: Any] = [kCGImageSourceCreateThumbnailFromImageAlways: true, kCGImageSourceCreateThumbnailWithTransform: true,
                                     kCGImageSourceThumbnailMaxPixelSize: max(ref.size.width, ref.size.height) * scale]
        guard let img = CGImageSourceCreateThumbnailAtIndex(src, 0, opts as CFDictionary) else { return nil }
        decoded[ObjectIdentifier(ref)] = (scale, img)
        return img
    }
}

private struct Builder {
    let doc: Document
    let styler: Styler
    let path: String
    let load: (@Sendable (String) throws -> Data)?
    let columnWidth: CGFloat
    let columnHeight: CGFloat
    var fonts: FontBook { styler.fonts }
    var asides: [String: Int] = [:]
    var blocks: [TextBlock] = []
    var refs: [(id: String, mark: String, block: Int, offset: Int)] = []
    var anchors: [String: Anchor] = [:]
    /// Block-element ids waiting for the next emitted block.
    var pendingAnchors: [String] = []
    /// Max of the adjoining margins since the last emitted block.
    var pendingMargin: CGFloat = 0
    /// Space fixed by `hr` (margins do not collapse through it).
    var fixedSpace: CGFloat = 0
    var pendingBreak = false
    var headingDepth = 0
    /// `li` marker waiting for the item's first text.
    var pendingMarker: String?
    /// `href` of the enclosing `a`.
    var link: String?

    init(doc: Document, styler: Styler, path: String, load: (@Sendable (String) throws -> Data)?, columnWidth: CGFloat, columnHeight: CGFloat) {
        self.doc = doc; self.styler = styler; self.path = path; self.load = load
        self.columnWidth = columnWidth; self.columnHeight = columnHeight
    }

    func ctFont(_ s: ComputedStyle, size: CGFloat? = nil) throws -> CTFont {
        try fonts.font(families: s.families, weight: s.weight, italic: s.italic, size: size ?? s.fontSize)
    }

    struct Inline {
        var string = NSMutableAttributedString()
        var refs: [(id: String, mark: String, offset: Int)] = []
        var lastIsSpace: Bool {
            string.length == 0 || [0x20, 0x2028, 0x2029].contains((string.string as NSString).character(at: string.length - 1))
        }
    }

    mutating func walkBlock(_ i: Int, _ s: ComputedStyle, width: CGFloat, insetLeft: CGFloat, insetRight: CGFloat, isRoot: Bool = false) throws {
        let tag = doc.nodes[i].tag
        if !isRoot { pendingMargin = max(pendingMargin, s.marginTop) }
        if s.breakBefore { pendingBreak = true }
        if let id = doc.nodes[i].id { pendingAnchors.append(id) }
        let heading = ["h1", "h2", "h3", "h4", "h5", "h6"].contains(tag)
        if heading { headingDepth += 1 }
        if tag == "li" { pendingMarker = marker(i) }
        defer {
            if heading { headingDepth -= 1 }
            if tag == "li" { pendingMarker = nil }
        }
        // WebKit's UA list `padding-left: 40px` (the profile has no padding).
        let pad: CGFloat = tag == "ul" || tag == "ol" ? 40 : 0
        let width = width - pad, insetLeft = insetLeft + pad
        var acc = Inline()
        var dropCap = s.dropCap
        for c in doc.children(i) {
            let n = doc.nodes[c]
            if n.kind == .text { try append(n.text, s, parentSize: s.fontSize, into: &acc); continue }
            if isNote(c) || n.tag == "svg" { continue }
            let cs = styler.compute(c, in: doc, parent: s, width: width)
            if cs.display == .none { continue }
            if n.tag == "img", cs.display == .block || onlyChild(c, of: i) {
                // §4.2 block image: aligned by its container's text-align.
                try flush(&acc, s, insetLeft: insetLeft, insetRight: insetRight, dropCap: &dropCap)
                if let id = n.id { pendingAnchors.append(id) }
                if let ref = image(c, maxWidth: width, maxHeight: columnHeight) {
                    emit(NSAttributedString(string: "\u{FFFC}"), s, insetLeft: insetLeft, insetRight: insetRight,
                         font: try ctFont(s), cap: nil, image: ref)
                }
            } else if cs.display == .block {
                try flush(&acc, s, insetLeft: insetLeft, insetRight: insetRight, dropCap: &dropCap)
                if n.tag == "hr" {
                    if cs.breakBefore { pendingBreak = true }
                    fixedSpace += max(pendingMargin, cs.marginTop)
                    pendingMargin = cs.marginBottom
                } else {
                    try walkBlock(c, cs, width: width - cs.marginLeft - cs.marginRight,
                                  insetLeft: insetLeft + cs.marginLeft, insetRight: insetRight + cs.marginRight)
                }
            } else {
                try walkInline(c, cs, parentSize: s.fontSize, into: &acc, collectRefs: true)
            }
        }
        try flush(&acc, s, insetLeft: insetLeft, insetRight: insetRight, dropCap: &dropCap)
        if !isRoot { pendingMargin = max(pendingMargin, s.marginBottom) }
    }

    /// The image is the only content of its block (whitespace aside).
    func onlyChild(_ c: Int, of i: Int) -> Bool {
        doc.children(i).allSatisfy { $0 == c || (doc.nodes[$0].kind == .text && doc.nodes[$0].text.allSatisfy { $0 == " " }) }
    }

    func marker(_ li: Int) -> String {
        let p = doc.nodes[li].parent
        guard p >= 0, doc.nodes[p].tag == "ol" else { return "• " }
        var n = 1
        var k = doc.previousElement(li)
        while let x = k { if doc.nodes[x].tag == "li" { n += 1 }; k = doc.previousElement(x) }
        return "\(n). "
    }

    /// A §5 footnote placed at the page bottom, not in the flow.
    func isNote(_ c: Int) -> Bool { doc.nodes[c].id.map { asides[$0] == c } ?? false }

    /// Natural size (px = pt), shrunk to fit `maxWidth` × `maxHeight` with its aspect ratio kept.
    func image(_ i: Int, maxWidth: CGFloat, maxHeight: CGFloat) -> ImageRef? {
        guard let src = doc.nodes[i].src, let load else { return nil }
        let p = Book.resolve(src, against: path).path
        guard let data = try? load(p), let source = CGImageSourceCreateWithData(data as CFData, nil),
              let props = CGImageSourceCopyPropertiesAtIndex(source, 0, nil) as? [CFString: Any],
              var w = (props[kCGImagePropertyPixelWidth] as? NSNumber).map({ CGFloat($0.doubleValue) }),
              var h = (props[kCGImagePropertyPixelHeight] as? NSNumber).map({ CGFloat($0.doubleValue) }),
              w > 0, h > 0 else { return nil }
        if ((props[kCGImagePropertyOrientation] as? NSNumber)?.intValue ?? 1) >= 5 { swap(&w, &h) }
        let k = min(1, maxWidth / w, maxHeight / h)
        return ImageRef(path: p, size: CGSize(width: w * k, height: h * k))
    }

    /// L3: U+FFFC with a run delegate, scaled to the line height. ponytail: the line box does not grow.
    mutating func inlineImage(_ i: Int, _ s: ComputedStyle, into acc: inout Inline) throws {
        guard let ref = image(i, maxWidth: columnWidth, maxHeight: s.lineHeightPt) else { return }
        var cb = CTRunDelegateCallbacks(version: kCTRunDelegateVersion1,
                                        dealloc: { Unmanaged<ImageRef>.fromOpaque($0).release() },
                                        getAscent: { Unmanaged<ImageRef>.fromOpaque($0).takeUnretainedValue().size.height },
                                        getDescent: { _ in 0 },
                                        getWidth: { Unmanaged<ImageRef>.fromOpaque($0).takeUnretainedValue().size.width })
        guard let d = CTRunDelegateCreate(&cb, Unmanaged.passRetained(ref).toOpaque()) else { return }
        acc.string.append(NSAttributedString(string: "\u{FFFC}", attributes: [
            fontAttribute: try ctFont(s), NSAttributedString.Key(kCTRunDelegateAttributeName as String): d, imageAttribute: ref,
        ]))
    }

    mutating func walkInline(_ i: Int, _ s: ComputedStyle, parentSize: CGFloat, into acc: inout Inline, collectRefs: Bool) throws {
        let n = doc.nodes[i]
        if n.tag == "br" { acc.string.append(NSAttributedString(string: "\u{2028}")); return }
        if n.tag == "img" { try inlineImage(i, s, into: &acc); return }
        if collectRefs, let id = n.id { anchors[id] = Anchor(block: blocks.count, offset: acc.string.length) }
        if collectRefs, doc.isNoteref(i), let href = n.href, href.hasPrefix("#") {
            acc.refs.append((String(href.dropFirst()), doc.textContent(i), acc.string.length))
        }
        let outerLink = link
        if n.tag == "a", let href = n.href, !doc.isNoteref(i) { link = href }
        defer { link = outerLink }
        // WebKit: super raises parent size / 3 + 1, sub lowers parent size / 5 + 1.
        let raise: CGFloat = switch s.verticalAlign {
        case .superscript: parentSize / 3 + 1
        case .subscript: -(parentSize / 5 + 1)
        case .baseline: 0
        }
        raiseStack += raise
        defer { raiseStack -= raise }
        for c in doc.children(i) {
            let cn = doc.nodes[c]
            if cn.kind == .text { try append(cn.text, s, parentSize: parentSize, into: &acc); continue }
            if isNote(c) || cn.tag == "svg" { continue }
            let cs = styler.compute(c, in: doc, parent: s, width: 0)
            if cs.display == .none { continue }
            try walkInline(c, cs, parentSize: s.fontSize, into: &acc, collectRefs: collectRefs)
        }
    }

    /// Current superscript raise (nested `sup` accumulate).
    var raiseStack: CGFloat = 0
    /// While building a note: length of its "MARK " prefix.
    var noteStart = 0

    mutating func append(_ text: String, _ s: ComputedStyle, parentSize: CGFloat, into acc: inout Inline) throws {
        var t = Substring(text)
        if t.first == " " && acc.lastIsSpace { t = t.dropFirst() }
        if t.isEmpty { return }
        if let m = pendingMarker { t = Substring(m) + t; pendingMarker = nil }
        let font = try ctFont(s)
        var attrs: [NSAttributedString.Key: Any] = [fontAttribute: font, languageAttribute: "vi"]
        if raiseStack != 0 { attrs[raiseAttribute] = raiseStack }
        if let link { attrs[linkAttribute] = link }
        acc.string.append(NSAttributedString(string: String(t), attributes: attrs))
    }

    mutating func flush(_ acc: inout Inline, _ s: ComputedStyle, insetLeft: CGFloat, insetRight: CGFloat, dropCap: inout DropCapRule?) throws {
        defer { acc = Inline() }
        while acc.string.length > 0, (acc.string.string as NSString).character(at: acc.string.length - 1) == 0x20 {
            acc.string.deleteCharacters(in: NSRange(location: acc.string.length - 1, length: 1))
        }
        guard acc.string.length > 0 else { return }
        let font = try ctFont(s)
        var cap: DropCap?
        if let rule = dropCap {
            cap = try makeDropCap(rule, acc.string, s, bodyFont: font)
            dropCap = nil
        }
        for r in acc.refs where r.offset < acc.string.length {
            refs.append((r.id, r.mark, blocks.count, r.offset))
        }
        emit(acc.string, s, insetLeft: insetLeft, insetRight: insetRight, font: font, cap: cap)
    }

    /// Appends a block, consuming the pending margin, anchors and forced break.
    mutating func emit(_ string: NSAttributedString, _ s: ComputedStyle, insetLeft: CGFloat, insetRight: CGFloat,
                       font: CTFont, cap: DropCap?, image: ImageRef? = nil) {
        for id in pendingAnchors { anchors[id] = Anchor(block: blocks.count, offset: 0) }
        pendingAnchors = []
        blocks.append(TextBlock(string: string, spaceBefore: fixedSpace + pendingMargin, insetLeft: insetLeft,
                                insetRight: insetRight, style: s, font: font, dropCap: cap, image: image,
                                breakBefore: pendingBreak, keepWithNext: headingDepth > 0))
        fixedSpace = 0; pendingMargin = 0; pendingBreak = false
    }

    func makeDropCap(_ rule: DropCapRule, _ string: NSMutableAttributedString, _ s: ComputedStyle, bodyFont: CTFont) throws -> DropCap {
        // ::first-letter = punctuation + one grapheme + punctuation that follows it directly (css-pseudo-4, as WebKit).
        let str = string.string
        var end = str.startIndex
        while end < str.endIndex, str[end].isPunctuation { end = str.index(after: end) }
        if end < str.endIndex { end = str.index(after: end) }
        while end < str.endIndex, str[end].isPunctuation { end = str.index(after: end) }
        let letter = String(str[..<end])
        let k = letter.utf16.count

        // §7.5.3: capHeight(cap) = (N−1)·LH + capHeight(body).
        var capStyle = s
        capStyle.families = rule.families ?? s.families
        capStyle.weight = rule.weight ?? s.weight
        let ref = try ctFont(capStyle, size: 100)
        let ratio = CTFontGetCapHeight(ref) / 100
        let size = (CGFloat(rule.size - 1) * s.lineHeightPt + CTFontGetCapHeight(bodyFont)) / ratio
        let capFont = try ctFont(capStyle, size: size)
        string.addAttribute(fontAttribute, value: capFont, range: NSRange(location: 0, length: k))
        let line = CTLineCreateWithAttributedString(NSAttributedString(string: letter, attributes: [fontAttribute: capFont]))
        return DropCap(rule: rule, length: k, line: line, font: capFont, capHeight: CTFontGetCapHeight(capFont),
                       advance: CGFloat(CTLineGetTypographicBounds(line, nil, nil, nil)),
                       ink: CTLineGetImageBounds(line, nil))
    }

    /// Note text: MARK + U+0020 + blocks joined with U+2029.
    mutating func note(id: String, mark: String, aside: Int, style noteStyle: ComputedStyle, width: CGFloat) throws -> Note {
        var acc = Inline()
        try append(mark + " ", noteStyle, parentSize: noteStyle.fontSize, into: &acc)
        noteStart = acc.string.length
        try noteContent(aside, noteStyle, width: width, into: &acc)
        while acc.string.length > 0, [0x20, 0x2029].contains((acc.string.string as NSString).character(at: acc.string.length - 1)) {
            acc.string.deleteCharacters(in: NSRange(location: acc.string.length - 1, length: 1))
        }
        let font = try ctFont(noteStyle)
        return Note(id: id, mark: mark, block: TextBlock(string: acc.string, spaceBefore: 0, insetLeft: 0, insetRight: 0,
                                                        style: noteStyle, font: font, dropCap: nil))
    }

    mutating func noteContent(_ i: Int, _ s: ComputedStyle, width: CGFloat, into acc: inout Inline) throws {
        for c in doc.children(i) {
            let n = doc.nodes[c]
            if n.tag == "svg" { continue }
            if n.kind == .text { try append(n.text, s, parentSize: s.fontSize, into: &acc); continue }
            let cs = styler.compute(c, in: doc, parent: s, width: width)
            if cs.display == .none { continue }
            if cs.display == .block {
                // Paragraph boundary inside the note (never right after "MARK ").
                if acc.string.length > noteStart {
                    while acc.string.length > noteStart, (acc.string.string as NSString).character(at: acc.string.length - 1) == 0x20 {
                        acc.string.deleteCharacters(in: NSRange(location: acc.string.length - 1, length: 1))
                    }
                    if !acc.string.string.hasSuffix("\u{2029}") { acc.string.append(NSAttributedString(string: "\u{2029}")) }
                }
                var inner = cs
                inner.indent = 0
                try noteContent(c, inner, width: width, into: &acc)
            } else {
                // Nested refs inside a note render as text and place no note.
                try walkInline(c, cs, parentSize: s.fontSize, into: &acc, collectRefs: false)
            }
        }
    }
}
