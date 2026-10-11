import Foundation
import libxml2

/// Why a book is refused (profile §9). Everything else opens, degraded if needed.
public struct BookError: Error, CustomStringConvertible {
    public let description: String
}

/// An opened EPUB: package metadata, manifest, spine and TOC. Content stays in the ZIP.
public struct Book: Sendable {
    public struct Item: Sendable, Encodable {
        public let id: String
        /// ZIP path, already resolved against the OPF directory.
        public let path: String
        public let mediaType: String
        public let properties: [String]
    }

    public struct TOCEntry: Sendable, Encodable {
        public let title: String
        /// ZIP path of the target spine document.
        public let path: String
        public let fragment: String?
        public let children: [TOCEntry]
    }

    public let zip: Zip
    public let opfPath: String
    public let version: String
    public private(set) var title = "", language = "", identifier = "", creator: String?
    public private(set) var manifest: [Item] = []
    public private(set) var spine: [Item] = []
    public private(set) var navPath = ""
    public private(set) var coverPath: String?
    public private(set) var toc: [TOCEntry] = []

    public init(url: URL) throws {
        try self.init(zip: Zip(url: url))
    }

    public init(zip: Zip) throws {
        self.zip = zip
        if zip.contains("META-INF/encryption.xml") || zip.entries.values.contains(where: \.encrypted) {
            throw BookError(description: "encrypted or DRM-protected book")
        }
        guard let opf = try XML(zip.read("META-INF/container.xml")).root.descendants("rootfile").first?.attr("full-path") else {
            throw BookError(description: "META-INF/container.xml has no rootfile")
        }
        opfPath = opf
        let pkg = try XML(zip.read(opf)).root
        version = pkg.attr("version") ?? ""
        guard (Double(version) ?? 0) >= 3 else {
            throw BookError(description: "EPUB \(version.isEmpty ? "2" : version) is not supported (EPUB 3 required)")
        }

        if let meta = pkg.child("metadata") {
            title = meta.child("title")?.text ?? ""
            language = meta.child("language")?.text ?? ""
            identifier = meta.child("identifier")?.text ?? ""
            creator = meta.child("creator")?.text
            for m in meta.children("meta") where m.attr("property") == "rendition:layout" && m.text != "reflowable" {
                throw BookError(description: "fixed-layout books are not supported")
            }
        }

        var byID: [String: Item] = [:]
        for i in pkg.child("manifest")?.children("item") ?? [] {
            guard let id = i.attr("id"), let href = i.attr("href") else { continue }
            let item = Item(id: id, path: Self.resolve(href, against: opf).path, mediaType: i.attr("media-type") ?? "",
                            properties: (i.attr("properties") ?? "").split(separator: " ").map(String.init))
            manifest.append(item)
            byID[id] = item
            if item.properties.contains("nav") { navPath = item.path }
            if item.properties.contains("cover-image") { coverPath = item.path }
        }
        guard !navPath.isEmpty else { throw BookError(description: "the book has no navigation document") }
        // ponytail: page-progression-direction ignored; RTL progression is not in v1.
        for r in pkg.child("spine")?.children("itemref") ?? [] {
            if let id = r.attr("idref"), let item = byID[id] { spine.append(item) }
        }
        toc = (try? readTOC()) ?? []
    }

    /// Bytes of a ZIP entry (a resolved path).
    public func data(_ path: String) throws -> Data { try zip.read(path) }

    public func spineIndex(path: String) -> Int? { spine.firstIndex { $0.path == path } }

    /// Uncompressed size of a ZIP entry (0 if absent): cheap progress weights from the central directory.
    public func size(_ path: String) -> Int { zip.entries[path]?.size ?? 0 }

    private func readTOC() throws -> [TOCEntry] {
        let navs = try XML(zip.read(navPath)).root.descendants("nav")
        let toc = navs.first { $0.attr("type", ns: Document.opsNamespace)?.split(separator: " ").contains("toc") == true }
        return toc?.child("ol").map(entries) ?? []
    }

    private func entries(_ ol: XML.Element) -> [TOCEntry] {
        ol.children("li").compactMap { li in
            guard let a = li.child("a"), let href = a.attr("href") else { return nil }
            let (path, fragment) = Self.resolve(href, against: navPath)
            let title = a.text.split(whereSeparator: \.isWhitespace).joined(separator: " ")
            return TOCEntry(title: title, path: path, fragment: fragment, children: li.child("ol").map(entries) ?? [])
        }
    }

    /// Resolves a relative href against the directory of `base` (a ZIP path). Percent-decoded; fragment split off.
    public static func resolve(_ href: String, against base: String) -> (path: String, fragment: String?) {
        let parts = href.split(separator: "#", maxSplits: 1, omittingEmptySubsequences: false)
        let rel = String(parts[0]).removingPercentEncoding ?? String(parts[0])
        let fragment = parts.count > 1 ? String(parts[1]) : nil
        if rel.isEmpty { return (base, fragment) }
        var stack = base.split(separator: "/").dropLast().map(String.init)
        for c in rel.split(separator: "/") {
            if c == ".." { _ = stack.popLast() } else if c != "." { stack.append(String(c)) }
        }
        return ((base.hasPrefix("/") ? "/" : "") + stack.joined(separator: "/"), fragment)
    }
}

/// Minimal read-only libxml2 tree for package files (container.xml, OPF, nav). Matching is by local name.
/// Every element retains the document, so elements stay valid after the `XML` value is gone.
struct XML {
    final class Handle {
        let doc: xmlDocPtr
        init(_ d: xmlDocPtr) { doc = d }
        deinit { xmlFreeDoc(doc) }
    }

    struct Element {
        let node: xmlNodePtr
        let handle: Handle

        var name: String { String(cString: node.pointee.name) }

        func attr(_ name: String, ns: String? = nil) -> String? {
            guard let p = ns.map({ xmlGetNsProp(node, name, $0) }) ?? xmlGetNoNsProp(node, name) else { return nil }
            defer { free(p) } // xmlFree is free() on Darwin; the global is not concurrency-safe
            return String(cString: p)
        }

        var text: String {
            guard let p = xmlNodeGetContent(node) else { return "" }
            defer { free(p) } // xmlFree is free() on Darwin; the global is not concurrency-safe
            return String(cString: p).trimmingCharacters(in: .whitespacesAndNewlines)
        }

        func children(_ name: String) -> [Element] {
            var out: [Element] = []
            var c = node.pointee.children
            while let n = c {
                if n.pointee.type == XML_ELEMENT_NODE, String(cString: n.pointee.name) == name { out.append(Element(node: n, handle: handle)) }
                c = n.pointee.next
            }
            return out
        }

        func child(_ name: String) -> Element? { children(name).first }

        func descendants(_ name: String) -> [Element] {
            var out: [Element] = []
            var c = node.pointee.children
            while let n = c {
                if n.pointee.type == XML_ELEMENT_NODE {
                    let e = Element(node: n, handle: handle)
                    if e.name == name { out.append(e) }
                    out += e.descendants(name)
                }
                c = n.pointee.next
            }
            return out
        }
    }

    let root: Element

    init(_ data: Data) throws {
        let options = Int32(XML_PARSE_NONET.rawValue | XML_PARSE_NOWARNING.rawValue | XML_PARSE_NOERROR.rawValue)
        let doc = data.withUnsafeBytes { raw in
            xmlReadMemory(raw.baseAddress?.assumingMemoryBound(to: CChar.self), Int32(raw.count), nil, nil, options)
        }
        guard let doc else { throw BookError(description: "malformed XML") }
        let handle = Handle(doc)
        guard let r = xmlDocGetRootElement(doc) else { throw BookError(description: "malformed XML") }
        root = Element(node: r, handle: handle)
    }
}
