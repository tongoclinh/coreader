import CoreText
import Foundation

public struct FontError: Error, CustomStringConvertible {
    public let description: String
}

/// Font resolution (engine-scope "Styling"): book `@font-face` → user `@font-face` → installed system
/// family → generics. Faces load from bytes and are never registered globally. No synthetic bold/italic.
public final class FontBook {
    public struct Face {
        public let family: String
        public let weight: Int
        public let italic: Bool
        /// `src` candidates in order: cache key and loader.
        public let sources: [(key: String, load: () throws -> Data)]
    }

    static let generics = ["serif": "Times New Roman", "sans-serif": "Helvetica", "monospace": "Menlo",
                           "cursive": "Apple Chancery", "fantasy": "Papyrus", "system-ui": "Helvetica"]

    /// Lowercased family → faces, in priority order (book before user).
    private var faces: [String: [Face]] = [:]
    private var descriptors: [String: CTFontDescriptor?] = [:]
    private var fonts: [Key: CTFont] = [:]

    private struct Key: Hashable { let families: [String]; let weight: Int; let italic: Bool; let size: CGFloat }

    public init(faces list: [Face]) {
        for f in list { faces[f.family.lowercased(), default: []].append(f) }
    }

    public func font(families: [String], weight: Int, italic: Bool, size: CGFloat) throws -> CTFont {
        let key = Key(families: families, weight: weight, italic: italic, size: size)
        if let f = fonts[key] { return f }
        for name in families + ["serif"] {
            if let d = descriptor(family: name, weight: weight, italic: italic) {
                let f = CTFontCreateWithFontDescriptor(d, size, nil)
                fonts[key] = f
                return f
            }
        }
        throw FontError(description: "no font for \(families)")
    }

    private func descriptor(family: String, weight: Int, italic: Bool) -> CTFontDescriptor? {
        let lower = family.lowercased()
        if let list = faces[lower], !list.isEmpty {
            // Book or user @font-face: style first, then CSS Fonts 4 weight matching.
            let styled = list.filter { $0.italic == italic }
            let pool = styled.isEmpty ? list : styled
            for face in pool.sorted(by: { Self.weightRank($0.weight, weight) < Self.weightRank($1.weight, weight) }) {
                for src in face.sources {
                    if let d = cached(src.key, { try? Self.loadDescriptors(src.load(), name: src.key).first }) { return d }
                }
            }
        }
        return system(Self.generics[lower] ?? family, bold: weight >= 600, italic: italic)
    }

    /// Installed family by name; the bold/italic face if the family has one.
    private func system(_ family: String, bold: Bool, italic: Bool) -> CTFontDescriptor? {
        cached("system:\(family):\(bold):\(italic)") {
            let base = CTFontCreateWithName(family as CFString, 100, nil)
            guard (CTFontCopyFamilyName(base) as String).caseInsensitiveCompare(family) == .orderedSame else { return nil }
            var traits: CTFontSymbolicTraits = []
            if bold { traits.insert(.traitBold) }
            if italic { traits.insert(.traitItalic) }
            let f = traits.isEmpty ? base : CTFontCreateCopyWithSymbolicTraits(base, 100, nil, traits, traits) ?? base
            return CTFontCopyFontDescriptor(f)
        }
    }

    private func cached(_ key: String, _ make: () -> CTFontDescriptor?) -> CTFontDescriptor? {
        if let d = descriptors[key] { return d }
        let d = make()
        descriptors[key] = d
        return d
    }

    /// Lower is better: CSS Fonts 4 §5.2 step 4 weight order.
    static func weightRank(_ w: Int, _ desired: Int) -> Int {
        if w == desired { return 0 }
        if (400...500).contains(desired) {
            if w > desired && w <= 500 { return w - desired }
            if w < desired { return 1000 + desired - w }
            return 2000 + w - desired
        }
        if desired < 400 { return w < desired ? desired - w : 1000 + w - desired }
        return w > desired ? w - desired : 1000 + desired - w
    }

    static func loadDescriptors(_ data: Data, name: String) throws -> [CTFontDescriptor] {
        guard let ds = CTFontManagerCreateFontDescriptorsFromData(data as CFData) as? [CTFontDescriptor], !ds.isEmpty else {
            throw FontError(description: "unreadable font file \(name)")
        }
        return ds
    }

    /// One line per face: family, PostScript name, full name, cap-height ratio, ascent/descent at 100 pt.
    public static func describe(_ url: URL) throws -> [String] {
        try loadDescriptors(Data(contentsOf: url), name: url.path).map { d in
            let f = CTFontCreateWithFontDescriptor(d, 100, nil)
            let family = CTFontCopyFamilyName(f) as String
            let ps = CTFontCopyPostScriptName(f) as String
            let full = CTFontCopyFullName(f) as String
            return String(format: "%@ | family \"%@\" | ps %@ | full \"%@\" | capHeight %.1f | ascent %.1f | descent %.1f",
                          url.lastPathComponent, family, ps, full, CTFontGetCapHeight(f), CTFontGetAscent(f), CTFontGetDescent(f))
        }
    }
}
