import Foundation

// CSS Syntax Level 3: tokenizer (§4) and parser (§5) with the spec's error recovery.
// ponytail: no `@import`/`@charset` handling (profile §3.5 allows only `@font-face`).

public enum CSSToken: Equatable, Sendable {
    case ident(String), function(String), atKeyword(String), hash(String, id: Bool)
    case string(String), badString, url(String), badURL, delim(Character)
    case number(Double), percentage(Double), dimension(Double, String)
    case whitespace, cdo, cdc, colon, semicolon, comma
    case openSquare, closeSquare, openParen, closeParen, openCurly, closeCurly
}

/// A component value: a preserved token, a `{}`/`[]`/`()` block, or a function.
public indirect enum CSSValue: Equatable, Sendable {
    case token(CSSToken)
    case block(Character, [CSSValue])
    case function(String, [CSSValue])
}

public struct CSSDeclaration: Sendable {
    /// Lowercased property name.
    public let name: String
    /// Value without surrounding whitespace and without `!important`.
    public let value: [CSSValue]
    public let important: Bool
}

public struct FontFaceRule: Sendable {
    public var family = ""
    /// Resolved resource paths (against the stylesheet's base), in `src` order.
    public var sources: [String] = []
    public var weight = 400
    public var italic = false
}

public struct StyleRule: Sendable {
    public let selectors: [Selector]
    public let declarations: [CSSDeclaration]
}

/// A parsed stylesheet. Rules outside the profile are kept (as counts) for diagnostics, never cascaded.
public struct Stylesheet: Sendable {
    public private(set) var rules: [StyleRule] = []
    public private(set) var fontFaces: [FontFaceRule] = []
    /// Ignored at-rules by name (`media`, `supports`, …) and rules dropped for an invalid selector.
    public private(set) var ignoredAtRules: [String: Int] = [:]
    public private(set) var invalidSelectors: [String] = []
    /// Path the stylesheet was read from; `url()` resolves against it.
    public let base: String

    public init(_ text: String, base: String) {
        self.base = base
        var p = Parser(tokens: Tokenizer.tokenize(text))
        for rule in p.consumeRuleList() {
            switch rule {
            case .at(let name, _, let block):
                if name == "font-face", let block { fontFaces.append(fontFace(block)) }
                else { ignoredAtRules[name, default: 0] += 1 }
            case .qualified(let prelude, let block):
                guard let sel = SelectorParser.parseList(prelude) else {
                    invalidSelectors.append(Self.serialize(prelude).trimmingCharacters(in: .whitespaces))
                    continue
                }
                var bp = Parser(values: block)
                rules.append(StyleRule(selectors: sel, declarations: bp.consumeDeclarations()))
            }
        }
    }

    private func fontFace(_ block: [CSSValue]) -> FontFaceRule {
        var f = FontFaceRule()
        var bp = Parser(values: block)
        for d in bp.consumeDeclarations() {
            let v = d.value.filter { $0 != .token(.whitespace) }
            switch d.name {
            case "font-family":
                f.family = Self.familyNames(d.value).first ?? ""
            case "src":
                for c in v {
                    switch c {
                    case .token(.url(let u)): f.sources.append(Book.resolve(u, against: base).path)
                    case .function("url", let args):
                        if case .token(.string(let u))? = args.first(where: { $0 != .token(.whitespace) }) {
                            f.sources.append(Book.resolve(u, against: base).path)
                        }
                    default: break
                    }
                }
            case "font-weight":
                switch v.first {
                case .token(.ident("bold")): f.weight = 700
                case .token(.number(let n)): f.weight = Int(n)
                default: f.weight = 400
                }
            case "font-style":
                if case .token(.ident(let s))? = v.first { f.italic = s == "italic" || s == "oblique" }
            default: break
            }
        }
        return f
    }

    /// `font-family` value → family names (quoted strings or space-joined idents), comma-separated.
    static func familyNames(_ value: [CSSValue]) -> [String] {
        var names: [String] = [], words: [String] = []
        func end() { if !words.isEmpty { names.append(words.joined(separator: " ")); words = [] } }
        for c in value {
            switch c {
            case .token(.string(let s)): end(); names.append(s)
            case .token(.ident(let s)): words.append(s)
            case .token(.comma): end()
            default: break
            }
        }
        end()
        return names
    }

    static func serialize(_ values: [CSSValue]) -> String {
        values.map { v -> String in
            switch v {
            case .token(let t):
                switch t {
                case .ident(let s): return s
                case .hash(let s, _): return "#" + s
                case .delim(let c): return String(c)
                case .whitespace: return " "
                case .colon: return ":"
                case .comma: return ","
                case .string(let s): return "\"\(s)\""
                case .number(let n): return String(n)
                default: return "?"
                }
            case .block(let o, let inner):
                let close: Character = o == "[" ? "]" : o == "(" ? ")" : "}"
                return String(o) + serialize(inner) + String(close)
            case .function(let n, let inner): return n + "(" + serialize(inner) + ")"
            }
        }.joined()
    }
}

// MARK: - Tokenizer

enum Tokenizer {
    static func tokenize(_ text: String) -> [CSSToken] {
        var t = Scanner(Array(text.unicodeScalars))
        var out: [CSSToken] = []
        while let tok = t.next() { out.append(tok) }
        return out
    }

    struct Scanner {
        let s: [Unicode.Scalar]
        var i = 0
        init(_ s: [Unicode.Scalar]) { self.s = s }

        func peek(_ k: Int = 0) -> Unicode.Scalar? { i + k < s.count ? s[i + k] : nil }

        static func isNameStart(_ c: Unicode.Scalar) -> Bool {
            c == "_" || (c >= "a" && c <= "z") || (c >= "A" && c <= "Z") || c.value >= 0x80
        }
        static func isName(_ c: Unicode.Scalar) -> Bool { isNameStart(c) || c == "-" || isDigit(c) }
        static func isDigit(_ c: Unicode.Scalar) -> Bool { c >= "0" && c <= "9" }
        static func isWS(_ c: Unicode.Scalar) -> Bool { c == " " || c == "\t" || c == "\n" || c == "\r" || c == "\u{C}" }

        func validEscape(_ k: Int = 0) -> Bool { peek(k) == "\\" && peek(k + 1) != nil && peek(k + 1) != "\n" }

        func startsIdent(_ k: Int = 0) -> Bool {
            guard let c = peek(k) else { return false }
            if c == "-" {
                guard let d = peek(k + 1) else { return false }
                return Self.isNameStart(d) || d == "-" || validEscape(k + 1)
            }
            return Self.isNameStart(c) || validEscape(k)
        }

        func startsNumber() -> Bool {
            guard let c = peek() else { return false }
            if Self.isDigit(c) { return true }
            if c == "+" || c == "-" {
                if let d = peek(1), Self.isDigit(d) { return true }
                return peek(1) == "." && peek(2).map(Self.isDigit) == true
            }
            return c == "." && peek(1).map(Self.isDigit) == true
        }

        mutating func escape() -> Unicode.Scalar {
            i += 1 // backslash
            guard let c = peek() else { return "\u{FFFD}" }
            if c.properties.isASCIIHexDigit {
                var hex = ""
                while hex.count < 6, let h = peek(), h.properties.isASCIIHexDigit { hex.unicodeScalars.append(h); i += 1 }
                if let w = peek(), Self.isWS(w) { i += 1 }
                let v = UInt32(hex, radix: 16) ?? 0
                return (v == 0 || v > 0x10FFFF || (0xD800...0xDFFF).contains(v)) ? "\u{FFFD}" : Unicode.Scalar(v)!
            }
            i += 1
            return c
        }

        mutating func name() -> String {
            var out = String.UnicodeScalarView()
            while let c = peek() {
                if Self.isName(c) { out.append(c); i += 1 } else if validEscape() { out.append(escape()) } else { break }
            }
            return String(out)
        }

        mutating func number() -> Double {
            var str = ""
            if let c = peek(), c == "+" || c == "-" { str.unicodeScalars.append(c); i += 1 }
            while let c = peek(), Self.isDigit(c) { str.unicodeScalars.append(c); i += 1 }
            if peek() == ".", peek(1).map(Self.isDigit) == true {
                str += "."; i += 1
                while let c = peek(), Self.isDigit(c) { str.unicodeScalars.append(c); i += 1 }
            }
            if let e = peek(), e == "e" || e == "E" {
                let signed = peek(1) == "+" || peek(1) == "-"
                if let d = peek(signed ? 2 : 1), Self.isDigit(d) {
                    str += "e"; i += 1
                    if signed { str.unicodeScalars.append(peek()!); i += 1 }
                    while let c = peek(), Self.isDigit(c) { str.unicodeScalars.append(c); i += 1 }
                }
            }
            return Double(str) ?? 0
        }

        mutating func string(_ quote: Unicode.Scalar) -> CSSToken {
            var out = String.UnicodeScalarView()
            while let c = peek() {
                i += 1
                if c == quote { return .string(String(out)) }
                if c == "\n" { i -= 1; return .badString }
                if c == "\\" {
                    if peek() == nil { continue }
                    if peek() == "\n" { i += 1; continue }
                    i -= 1; out.append(escape())
                } else { out.append(c) }
            }
            return .string(String(out))
        }

        mutating func url() -> CSSToken {
            while let c = peek(), Self.isWS(c) { i += 1 }
            var out = String.UnicodeScalarView()
            while let c = peek() {
                if c == ")" { i += 1; return .url(String(out)) }
                if Self.isWS(c) {
                    while let w = peek(), Self.isWS(w) { i += 1 }
                    if peek() == ")" || peek() == nil { i += peek() == nil ? 0 : 1; return .url(String(out)) }
                    break
                }
                if c == "\"" || c == "'" || c == "(" { break }
                if c == "\\" {
                    if validEscape() { out.append(escape()); continue }
                    break
                }
                out.append(c); i += 1
            }
            if peek() == nil { return .url(String(out)) }
            // Bad URL: consume the remnants.
            while let c = peek() {
                i += 1
                if c == ")" { break }
                if c == "\\", peek() != nil { i += 1 }
            }
            return .badURL
        }

        mutating func numeric() -> CSSToken {
            let n = number()
            if startsIdent() { return .dimension(n, name().lowercased()) }
            if peek() == "%" { i += 1; return .percentage(n) }
            return .number(n)
        }

        mutating func identLike() -> CSSToken {
            let n = name()
            if peek() == "(" {
                i += 1
                if n.lowercased() == "url" {
                    var k = 0
                    while let w = peek(k), Self.isWS(w) { k += 1 }
                    if let q = peek(k), q == "\"" || q == "'" { return .function("url") }
                    return url()
                }
                return .function(n.lowercased())
            }
            return .ident(n)
        }

        mutating func next() -> CSSToken? {
            // Comments.
            while peek() == "/" && peek(1) == "*" {
                i += 2
                while i < s.count && !(peek() == "*" && peek(1) == "/") { i += 1 }
                i = min(s.count, i + 2)
            }
            guard let c = peek() else { return nil }
            if Self.isWS(c) { while let w = peek(), Self.isWS(w) { i += 1 }; return .whitespace }
            switch c {
            case "\"", "'": i += 1; return string(c)
            case "#":
                if let d = peek(1), Self.isName(d) || validEscape(1) {
                    i += 1
                    let id = startsIdent()
                    return .hash(name(), id: id)
                }
                i += 1; return .delim("#")
            case "(": i += 1; return .openParen
            case ")": i += 1; return .closeParen
            case "[": i += 1; return .openSquare
            case "]": i += 1; return .closeSquare
            case "{": i += 1; return .openCurly
            case "}": i += 1; return .closeCurly
            case ",": i += 1; return .comma
            case ":": i += 1; return .colon
            case ";": i += 1; return .semicolon
            case "+", ".":
                if startsNumber() { return numeric() }
                i += 1; return .delim(Character(c))
            case "-":
                if startsNumber() { return numeric() }
                if peek(1) == "-" && peek(2) == ">" { i += 3; return .cdc }
                if startsIdent() { return identLike() }
                i += 1; return .delim("-")
            case "<":
                if peek(1) == "!" && peek(2) == "-" && peek(3) == "-" { i += 4; return .cdo }
                i += 1; return .delim("<")
            case "@":
                if startsIdent(1) { i += 1; return .atKeyword(name().lowercased()) }
                i += 1; return .delim("@")
            case "\\":
                if validEscape() { return identLike() }
                i += 1; return .delim("\\")
            default:
                if Self.isDigit(c) { return numeric() }
                if Self.isNameStart(c) { return identLike() }
                i += 1; return .delim(Character(c))
            }
        }
    }
}

// MARK: - Parser

struct Parser {
    enum Rule {
        case at(String, prelude: [CSSValue], block: [CSSValue]?)
        case qualified(prelude: [CSSValue], block: [CSSValue])
    }

    private var values: [CSSValue]
    private var i = 0

    init(tokens: [CSSToken]) {
        var k = 0
        values = Self.componentValues(tokens, &k, until: nil)
    }

    init(values: [CSSValue]) { self.values = values }

    /// Groups tokens into blocks and functions.
    private static func componentValues(_ t: [CSSToken], _ k: inout Int, until close: CSSToken?) -> [CSSValue] {
        var out: [CSSValue] = []
        while k < t.count {
            let tok = t[k]; k += 1
            if let close, tok == close { return out }
            switch tok {
            case .openCurly: out.append(.block("{", componentValues(t, &k, until: .closeCurly)))
            case .openSquare: out.append(.block("[", componentValues(t, &k, until: .closeSquare)))
            case .openParen: out.append(.block("(", componentValues(t, &k, until: .closeParen)))
            case .function(let n): out.append(.function(n, componentValues(t, &k, until: .closeParen)))
            default: out.append(.token(tok))
            }
        }
        return out
    }

    mutating func consumeRuleList() -> [Rule] {
        var rules: [Rule] = []
        while i < values.count {
            let v = values[i]
            switch v {
            case .token(.whitespace): i += 1
            case .token(.cdo), .token(.cdc): i += 1 // top level only; nested lists never call this
            case .token(.atKeyword(let name)):
                i += 1
                var prelude: [CSSValue] = []
                while i < values.count {
                    let x = values[i]; i += 1
                    if x == .token(.semicolon) { rules.append(.at(name, prelude: prelude, block: nil)); break }
                    if case .block("{", let b) = x { rules.append(.at(name, prelude: prelude, block: b)); break }
                    prelude.append(x)
                }
            default:
                var prelude: [CSSValue] = []
                while i < values.count {
                    let x = values[i]; i += 1
                    if case .block("{", let b) = x { rules.append(.qualified(prelude: prelude, block: b)); break }
                    prelude.append(x)
                }
            }
        }
        return rules
    }

    /// Declaration list (§5.4.5): `name: value [!important];`, invalid ones skipped to the next `;`.
    mutating func consumeDeclarations() -> [CSSDeclaration] {
        var out: [CSSDeclaration] = []
        while i < values.count {
            let v = values[i]
            switch v {
            case .token(.whitespace), .token(.semicolon): i += 1
            case .token(.atKeyword):
                // Nested at-rule: skip it with its block.
                i += 1
                while i < values.count {
                    let x = values[i]; i += 1
                    if x == .token(.semicolon) { break }
                    if case .block("{", _) = x { break }
                }
            default:
                var decl: [CSSValue] = []
                while i < values.count, values[i] != .token(.semicolon) { decl.append(values[i]); i += 1 }
                if let d = Self.declaration(decl) { out.append(d) }
            }
        }
        return out
    }

    private static func declaration(_ v: [CSSValue]) -> CSSDeclaration? {
        guard case .token(.ident(let name))? = v.first else { return nil }
        var k = 1
        while k < v.count, v[k] == .token(.whitespace) { k += 1 }
        guard k < v.count, v[k] == .token(.colon) else { return nil }
        var value = Array(v[(k + 1)...])
        func trim() {
            while value.first == .token(.whitespace) { value.removeFirst() }
            while value.last == .token(.whitespace) { value.removeLast() }
        }
        trim()
        var important = false
        if case .token(.ident(let s))? = value.last, s.lowercased() == "important" {
            var j = value.count - 2
            while j >= 0, value[j] == .token(.whitespace) { j -= 1 }
            if j >= 0, value[j] == .token(.delim("!")) { important = true; value.removeSubrange(j...); trim() }
        }
        return CSSDeclaration(name: name.lowercased(), value: value, important: important)
    }
}
