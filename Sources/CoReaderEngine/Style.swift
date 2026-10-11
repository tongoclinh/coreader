import CoreGraphics
import CoreText
import Foundation

public enum Display: Sendable { case block, inline, none }
public enum TextAlign: Sendable { case left, right, center, justify }
public enum VerticalAlign: Sendable { case baseline, superscript, `subscript` }

/// `X::first-letter { initial-letter: size sink; font-family; font-weight; margin-right }` (profile §6).
public struct DropCapRule: Sendable, Equatable {
    public var size: Int
    public var sink: Int
    /// nil = inherited from the paragraph.
    public var families: [String]?
    public var weight: Int?
    public var marginRight: CGFloat
}

/// `line-height`: numbers inherit as numbers; `normal` keeps the font's own line spacing ratio.
public enum LineHeight: Sendable, Equatable {
    case number(CGFloat), px(CGFloat), normal(ratio: CGFloat)
}

public struct ComputedStyle: Sendable {
    // Inherited.
    public var families = ["serif"]
    public var fontSize: CGFloat = 16
    public var weight = 400
    public var italic = false
    public var lineHeight = LineHeight.normal(ratio: 1.2)
    public var align = TextAlign.left
    /// Computed `text-indent`: px, or `%` (resolved per block).
    var indentValue = Length.px(0)
    // Not inherited.
    public var display = Display.inline
    public var indent: CGFloat = 0
    public var marginTop: CGFloat = 0
    public var marginBottom: CGFloat = 0
    public var marginLeft: CGFloat = 0
    public var marginRight: CGFloat = 0
    public var verticalAlign = VerticalAlign.baseline
    public var breakBefore = false
    public var dropCap: DropCapRule?

    public var lineHeightPt: CGFloat {
        switch lineHeight {
        case .number(let n): n * fontSize
        case .px(let v): v
        case .normal(let r): r * fontSize
        }
    }
}

enum Length: Sendable, Equatable {
    case px(CGFloat), em(CGFloat), rem(CGFloat), percent(CGFloat)

    func resolve(em: CGFloat, rem: CGFloat, width: CGFloat) -> CGFloat {
        switch self {
        case .px(let v): v
        case .em(let v): v * em
        case .rem(let v): v * rem
        case .percent(let v): v / 100 * width
        }
    }
}

/// UA sheet: HTML defaults for profile elements, following WebKit `html.css`.
/// ponytail: no `padding` in the profile; list indentation (WebKit: padding-left 40px) is left to P3.
let uaCSS = """
html, body, section, div, p, h1, h2, h3, h4, h5, h6, blockquote, hr, figure, figcaption, header, footer,
ul, ol, li, aside, nav, article, main, address, pre, dl, dt, dd { display: block }
head, link, meta, title, script, style { display: none }
p { margin: 1em 0 }
blockquote, figure { margin: 1em 40px }
ul, ol { margin: 1em 0 }
dd { margin-left: 40px }
hr { margin: 0.5em auto }
h1 { font-size: 2em; margin: 0.67em 0; font-weight: bold }
h2 { font-size: 1.5em; margin: 0.83em 0; font-weight: bold }
h3 { font-size: 1.17em; margin: 1em 0; font-weight: bold }
h4 { margin: 1.33em 0; font-weight: bold }
h5 { font-size: 0.83em; margin: 1.67em 0; font-weight: bold }
h6 { font-size: 0.67em; margin: 2.33em 0; font-weight: bold }
em, i, cite, var, dfn, address { font-style: italic }
strong, b { font-weight: bolder }
small { font-size: smaller }
sub { vertical-align: sub; font-size: smaller }
sup { vertical-align: super; font-size: smaller }
"""

/// One stylesheet with its cascade origin and a loader for the resources it references.
public struct StyleSource {
    public enum Origin: Sendable { case ua, user, book }
    public let sheet: Stylesheet
    public let origin: Origin
    /// Reads a resource path produced by `url()` resolution (ZIP entry or file path).
    public let load: @Sendable (String) throws -> Data

    public init(sheet: Stylesheet, origin: Origin, load: @escaping @Sendable (String) throws -> Data) {
        self.sheet = sheet; self.origin = origin; self.load = load
    }
}

/// Cascade (CSS Cascade 4, five origins) over the flat DOM, plus computed values.
public final class Styler {
    public let fonts: FontBook

    private struct Entry {
        let selector: Selector
        let declarations: [CSSDeclaration]
        let origin: StyleSource.Origin
        let order: Int
    }

    private var byID: [String: [Entry]] = [:], byClass: [String: [Entry]] = [:], byTag: [String: [Entry]] = [:]
    private var universal: [Entry] = []
    private var rootFontSize: CGFloat = 16

    /// User CSS is merged after the book CSS as if it were one author stylesheet (web model): at equal
    /// specificity and importance the user wins by order; a more specific or `!important` book rule still wins.
    /// The UA sheet is added here.
    public init(sources: [StyleSource]) {
        let ua = StyleSource(sheet: Stylesheet(uaCSS, base: ""), origin: .ua) { _ in Data() }
        var order = 0
        for src in [ua] + sources.filter({ $0.origin == .book }) + sources.filter({ $0.origin == .user }) {
            for rule in src.sheet.rules {
                for sel in rule.selectors {
                    let e = Entry(selector: sel, declarations: rule.declarations, origin: src.origin, order: order)
                    order += 1
                    let key = sel.compounds[sel.compounds.count - 1]
                    if let id = key.id { byID[id, default: []].append(e) }
                    else if let c = key.classes.first { byClass[c, default: []].append(e) }
                    else if let t = key.tag { byTag[t, default: []].append(e) }
                    else { universal.append(e) }
                }
            }
        }
        // User faces first: later @font-face rules win, as in the merged sheet.
        var faces: [FontBook.Face] = []
        for origin in [StyleSource.Origin.user, .book] {
            for src in sources where src.origin == origin {
                for f in src.sheet.fontFaces where !f.family.isEmpty {
                    let load = src.load
                    faces.append(FontBook.Face(family: f.family, weight: f.weight, italic: f.italic,
                                               sources: f.sources.map { p in ("\(origin):\(p)", { try load(p) }) }))
                }
            }
        }
        fonts = FontBook(faces: faces)
    }

    /// Book stylesheets of a document: its `<link rel=stylesheet>` hrefs resolved against `path`.
    public static func bookSources(_ doc: Document, path: String, load: @escaping @Sendable (String) throws -> Data) throws -> [StyleSource] {
        try doc.stylesheets.map { href in
            let p = Book.resolve(href, against: path).path
            return StyleSource(sheet: Stylesheet(String(decoding: try load(p), as: UTF8.self), base: p), origin: .book, load: load)
        }
    }

    /// Computed style of `<body>` (through the virtual `<html>`). `width`: the column width.
    public func root(_ doc: Document, width: CGFloat) -> ComputedStyle {
        var initial = ComputedStyle()
        initial.lineHeight = .normal(ratio: normalRatio(initial))
        let html = compute(Selector.html, in: doc, parent: initial, width: width)
        rootFontSize = html.fontSize
        return compute(doc.body, in: doc, parent: html, width: width)
    }

    /// Computed style of element `i`. `width`: the containing block's content width (for `%`).
    public func compute(_ i: Int, in doc: Document, parent: ComputedStyle, width: CGFloat) -> ComputedStyle {
        let decls = cascade(i, doc, firstLetter: false)
        var s = parent
        s.display = .inline
        s.marginTop = 0; s.marginBottom = 0; s.marginLeft = 0; s.marginRight = 0
        s.verticalAlign = .baseline
        s.breakBefore = false
        s.dropCap = nil

        func value(_ name: String) -> [CSSValue]? {
            guard let v = decls[name] else { return nil }
            if Self.keyword(v) == "inherit" { return nil } // inherited properties already hold the parent value
            return v
        }
        let rem = i == Selector.html ? 16 : rootFontSize

        // Font size first: `em` everywhere else resolves against it.
        if let v = value("font-size") { s.fontSize = Self.fontSize(v, parent: parent.fontSize, rem: rem) ?? parent.fontSize }
        if let v = value("font-family") {
            let names = Stylesheet.familyNames(v)
            if !names.isEmpty { s.families = names }
        }
        if let v = value("font-weight") { s.weight = Self.weight(v, parent: parent.weight) ?? parent.weight }
        if let v = value("font-style"), let k = Self.keyword(v) { s.italic = k == "italic" || k == "oblique" }
        if let k = value("text-align").flatMap(Self.keyword) {
            switch k {
            case "left", "start": s.align = .left
            case "right", "end": s.align = .right
            case "center": s.align = .center
            case "justify": s.align = .justify
            default: break
            }
        }
        if let v = value("text-indent"), let l = Self.length(v) {
            // Computed value: em/rem become px here and inherit as px; % stays relative to each block.
            if case .percent = l { s.indentValue = l } else { s.indentValue = .px(l.resolve(em: s.fontSize, rem: rem, width: 0)) }
        }
        if let v = value("line-height") {
            if Self.keyword(v) == "normal" { s.lineHeight = .normal(ratio: 0) }
            else if case .token(.number(let n))? = v.first, v.count == 1 { s.lineHeight = .number(n) }
            else if let l = Self.length(v) { s.lineHeight = .px(l.resolve(em: s.fontSize, rem: rem, width: s.fontSize)) }
        }
        if case .normal = s.lineHeight { s.lineHeight = .normal(ratio: normalRatio(s)) }
        if let k = value("display").flatMap(Self.keyword) {
            switch k {
            case "none": s.display = .none
            case "block", "list-item", "flow-root": s.display = .block
            case "inline", "inline-block": s.display = .inline
            default: break
            }
        }
        if let k = value("vertical-align").flatMap(Self.keyword) {
            s.verticalAlign = k == "super" ? .superscript : k == "sub" ? .subscript : .baseline
        }
        for name in ["break-before", "page-break-before"] {
            if let k = value(name).flatMap(Self.keyword) { s.breakBefore = ["page", "always", "left", "right"].contains(k) }
        }
        func margin(_ side: String) -> CGFloat {
            guard let v = value("margin-" + side), let l = Self.length(v) else { return 0 }
            return l.resolve(em: s.fontSize, rem: rem, width: width)
        }
        s.marginTop = margin("top"); s.marginRight = margin("right")
        s.marginBottom = margin("bottom"); s.marginLeft = margin("left")
        s.indent = s.indentValue.resolve(em: s.fontSize, rem: rem, width: width)
        if i >= 0 { s.dropCap = dropCap(i, doc, s) }
        return s
    }

    /// `::first-letter` with `initial-letter` (profile §6); other first-letter properties are ignored.
    private func dropCap(_ i: Int, _ doc: Document, _ s: ComputedStyle) -> DropCapRule? {
        let d = cascade(i, doc, firstLetter: true)
        guard let il = d["initial-letter"] else { return nil }
        let nums = il.compactMap { v -> Int? in if case .token(.number(let n)) = v, n >= 1, n == n.rounded() { Int(n) } else { nil } }
        guard let size = nums.first, (2...5).contains(size) else { return nil }
        var rule = DropCapRule(size: size, sink: nums.count > 1 ? nums[1] : size, families: nil, weight: nil, marginRight: 0)
        if let v = d["font-family"] { let n = Stylesheet.familyNames(v); if !n.isEmpty { rule.families = n } }
        if let v = d["font-weight"] { rule.weight = Self.weight(v, parent: s.weight) }
        if let v = d["margin-right"], let l = Self.length(v) {
            rule.marginRight = l.resolve(em: s.fontSize, rem: rootFontSize, width: 0) // ponytail: em against the paragraph, not the cap
        }
        return rule
    }

    private func normalRatio(_ s: ComputedStyle) -> CGFloat {
        guard let f = try? fonts.font(families: s.families, weight: s.weight, italic: s.italic, size: 100) else { return 1.2 }
        return (CTFontGetAscent(f) + CTFontGetDescent(f) + CTFontGetLeading(f)) / 100
    }

    // MARK: cascade

    /// Winning declared value per (longhand) property for element `i`.
    private func cascade(_ i: Int, _ doc: Document, firstLetter: Bool) -> [String: [CSSValue]] {
        var candidates: [Entry] = universal
        if i == Selector.html {
            candidates += byTag["html"] ?? []
        } else {
            let n = doc.nodes[i]
            if let id = n.id { candidates += byID[id] ?? [] }
            for c in n.classes { candidates += byClass[c] ?? [] }
            candidates += byTag[n.tag] ?? []
        }
        var matched: [(rank: Int, specificity: Int, order: Int, decl: CSSDeclaration)] = []
        for e in candidates where e.selector.firstLetter == firstLetter && e.selector.matches(i, in: doc) {
            for d in e.declarations {
                let rank = switch (e.origin, d.important) {
                case (.ua, false): 0
                case (.book, false), (.user, false): 1
                case (.book, true), (.user, true): 2
                case (.ua, true): 3
                }
                matched.append((rank, e.selector.specificity, e.order, d))
            }
        }
        matched.sort { ($0.rank, $0.specificity, $0.order) < ($1.rank, $1.specificity, $1.order) }
        var out: [String: [CSSValue]] = [:]
        for m in matched {
            for (name, value) in Self.longhands(m.decl) where Self.valid(name, value) { out[name] = value }
        }
        return out
    }

    /// Shorthand expansion (`margin` only).
    static func longhands(_ d: CSSDeclaration) -> [(String, [CSSValue])] {
        guard d.name == "margin" else { return [(d.name, d.value)] }
        let parts = d.value.filter { $0 != .token(.whitespace) }.map { [$0] }
        let sides: [[CSSValue]]
        switch parts.count {
        case 1: sides = [parts[0], parts[0], parts[0], parts[0]]
        case 2: sides = [parts[0], parts[1], parts[0], parts[1]]
        case 3: sides = [parts[0], parts[1], parts[2], parts[1]]
        case 4: sides = parts
        default: return []
        }
        return zip(["margin-top", "margin-right", "margin-bottom", "margin-left"], sides).map { ($0, $1) }
    }

    /// Properties the registry knows (shorthands included); everything else is ignored (§9).
    public static let knownProperties: Set<String> = [
        "font-size", "font-family", "font-weight", "font-style", "text-align", "text-indent", "line-height", "margin",
        "margin-top", "margin-right", "margin-bottom", "margin-left", "display", "vertical-align", "break-before",
        "page-break-before", "hyphens", "initial-letter",
    ]

    /// Property registry: profile §3.3 properties and the values each accepts. Invalid declarations never win.
    static func valid(_ name: String, _ v: [CSSValue]) -> Bool {
        let k = keyword(v)
        if k == "inherit" { return true }
        switch name {
        case "font-size": return (fontSize(v, parent: 16, rem: 16) ?? -1) >= 0
        case "font-family": return !Stylesheet.familyNames(v).isEmpty
        case "font-weight": return weight(v, parent: 400) != nil
        case "font-style": return ["normal", "italic", "oblique"].contains(k)
        case "text-align": return ["left", "right", "center", "justify", "start", "end"].contains(k)
        case "text-indent": return length(v) != nil
        case "line-height":
            if k == "normal" { return true }
            if case .token(.number(let n))? = v.first, v.count == 1 { return n >= 0 }
            return length(v).map { $0.resolve(em: 1, rem: 1, width: 1) >= 0 } ?? false
        case "margin-top", "margin-right", "margin-bottom", "margin-left": return length(v) != nil
        case "display": return ["none", "block", "inline", "list-item", "inline-block", "flow-root"].contains(k)
        case "vertical-align": return ["baseline", "super", "sub"].contains(k)
        case "break-before", "page-break-before": return ["auto", "page", "always", "left", "right", "avoid"].contains(k)
        case "hyphens": return false // parsed and ignored (no hyphenation in v1)
        case "initial-letter": return k == "normal" || v.contains { if case .token(.number) = $0 { true } else { false } }
        default: return false // outside the profile: ignored (§9)
        }
    }

    // MARK: values

    static func keyword(_ v: [CSSValue]) -> String? {
        guard v.count == 1, case .token(.ident(let s)) = v[0] else { return nil }
        return s.lowercased()
    }

    /// Length or percentage; `auto` computes to 0 (no widths in the profile). Unitless 0 allowed.
    static func length(_ v: [CSSValue]) -> Length? {
        guard v.count == 1, case .token(let t) = v[0] else { return nil }
        switch t {
        case .ident(let s) where s.lowercased() == "auto": return .px(0)
        case .number(0): return .px(0)
        case .percentage(let p): return .percent(p)
        case .dimension(let n, let unit):
            switch unit {
            case "px": return .px(n)
            case "pt": return .px(n * 4 / 3)
            case "em": return .em(n)
            case "rem": return .rem(n)
            default: return nil
            }
        default: return nil
        }
    }

    static func fontSize(_ v: [CSSValue], parent: CGFloat, rem: CGFloat) -> CGFloat? {
        if let k = keyword(v) {
            // WebKit's absolute-size table for a 16 px medium; smaller/larger scale by 1.2.
            let table: [String: CGFloat] = ["xx-small": 9, "x-small": 10, "small": 13, "medium": 16,
                                            "large": 18, "x-large": 24, "xx-large": 32]
            if let s = table[k] { return s }
            if k == "smaller" { return parent / 1.2 }
            if k == "larger" { return parent * 1.2 }
            return nil
        }
        guard let l = length(v) else { return nil }
        if case .ident = v.first.flatMap({ if case .token(let t) = $0 { t } else { nil } }) { return nil } // `auto`
        return l.resolve(em: parent, rem: rem, width: parent)
    }

    static func weight(_ v: [CSSValue], parent: Int) -> Int? {
        if let k = keyword(v) {
            switch k {
            case "normal": return 400
            case "bold": return 700
            case "bolder": return parent < 350 ? 400 : parent < 550 ? 700 : 900
            case "lighter": return parent < 550 ? 100 : parent < 750 ? 400 : 700
            default: return nil
            }
        }
        guard v.count == 1, case .token(.number(let n)) = v[0], (1...1000).contains(n) else { return nil }
        return Int(n)
    }
}
