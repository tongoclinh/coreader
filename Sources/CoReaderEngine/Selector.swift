/// Profile §3.2 selectors: type, `*`, `.class`, `#id`, compounds, descendant, `>`, `+`, lists, `::first-letter`.
/// Anything else makes the whole selector list invalid, which drops the rule (Selectors 4 §3.1).
public struct Selector: Sendable {
    public struct Compound: Sendable {
        /// nil = universal.
        public var tag: String?
        public var id: String?
        public var classes: [String] = []
    }

    public enum Combinator: Sendable { case descendant, child, adjacent }

    /// Left to right; `combinators[k]` sits between `compounds[k]` and `compounds[k + 1]`.
    public let compounds: [Compound]
    public let combinators: [Combinator]
    public let firstLetter: Bool
    /// (ids, classes, types) packed as a sortable integer.
    public let specificity: Int

    /// The virtual `<html>` element (the flat DOM starts at `<body>`).
    public static let html = -2

    func matches(_ i: Int, in doc: Document) -> Bool {
        matches(compounds.count - 1, at: i, doc)
    }

    private func matches(_ k: Int, at i: Int, _ doc: Document) -> Bool {
        guard Self.matches(compounds[k], i, doc) else { return false }
        if k == 0 { return true }
        switch combinators[k - 1] {
        case .child:
            guard let p = Self.parent(i, doc) else { return false }
            return matches(k - 1, at: p, doc)
        case .adjacent:
            guard i >= 0, let p = doc.previousElement(i) else { return false }
            return matches(k - 1, at: p, doc)
        case .descendant:
            var a = Self.parent(i, doc)
            while let p = a {
                if matches(k - 1, at: p, doc) { return true }
                a = Self.parent(p, doc)
            }
            return false
        }
    }

    static func parent(_ i: Int, _ doc: Document) -> Int? {
        if i == html { return nil }
        let p = doc.nodes[i].parent
        return p >= 0 ? p : html
    }

    static func matches(_ c: Compound, _ i: Int, _ doc: Document) -> Bool {
        if i == html { return (c.tag == nil || c.tag == "html") && c.id == nil && c.classes.isEmpty }
        let n = doc.nodes[i]
        if let t = c.tag, t != n.tag { return false }
        if let id = c.id, id != n.id { return false }
        return c.classes.allSatisfy(n.classes.contains)
    }
}

enum SelectorParser {
    /// Parses a rule prelude; nil if any selector in the list is invalid.
    static func parseList(_ prelude: [CSSValue]) -> [Selector]? {
        var out: [Selector] = []
        var part: [CSSValue] = []
        for v in prelude + [.token(.comma)] {
            if v == .token(.comma) {
                guard let s = parse(part) else { return nil }
                out.append(s)
                part = []
            } else { part.append(v) }
        }
        return out.isEmpty ? nil : out
    }

    private static func parse(_ v: [CSSValue]) -> Selector? {
        var compounds: [Selector.Compound] = []
        var combinators: [Selector.Combinator] = []
        var current: Selector.Compound?
        var pending: Selector.Combinator?
        var firstLetter = false
        var ids = 0, classes = 0, types = 0
        var k = 0

        func startCompound() -> Bool {
            if current != nil { return true }
            if !compounds.isEmpty {
                guard let c = pending else { return false }
                combinators.append(c)
                pending = nil
            } else if pending != nil { return false }
            current = Selector.Compound()
            return true
        }
        func endCompound() {
            if let c = current { compounds.append(c); current = nil }
        }

        while k < v.count {
            if firstLetter && v[k] != .token(.whitespace) { return nil } // the pseudo-element must be last
            switch v[k] {
            case .token(.whitespace):
                endCompound()
                if pending == nil && !compounds.isEmpty { pending = .descendant }
            case .token(.delim(">")), .token(.delim("+")):
                endCompound()
                guard !compounds.isEmpty, pending == nil || pending == .descendant else { return nil }
                pending = v[k] == .token(.delim(">")) ? .child : .adjacent
            case .token(.ident(let name)):
                guard current == nil, startCompound() else { return nil }
                current!.tag = name; types += 1 // XHTML: type selectors are case-sensitive
            case .token(.delim("*")):
                guard current == nil, startCompound() else { return nil }
            case .token(.delim(".")):
                guard k + 1 < v.count, case .token(.ident(let name)) = v[k + 1], startCompound() else { return nil }
                current!.classes.append(name); classes += 1; k += 1
            case .token(.hash(let name, id: true)):
                guard startCompound() else { return nil }
                current!.id = name; ids += 1
            case .token(.colon):
                // `::first-letter` or legacy `:first-letter`.
                var j = k + 1
                if j < v.count, v[j] == .token(.colon) { j += 1 }
                guard j < v.count, case .token(.ident(let name)) = v[j], name.lowercased() == "first-letter" else { return nil }
                if current == nil { guard startCompound() else { return nil } }
                firstLetter = true; types += 1; k = j
            default:
                return nil
            }
            k += 1
        }
        endCompound()
        if pending != nil && pending != .descendant { return nil }
        guard !compounds.isEmpty, combinators.count == compounds.count - 1 else { return nil }
        return Selector(compounds: compounds, combinators: combinators, firstLetter: firstLetter,
                        specificity: ids << 20 | classes << 10 | types)
    }
}
