import Foundation
import libxml2

/// One node of the flat DOM. Indices point into `Document.nodes`; -1 means none.
public struct Node: Sendable {
    public enum Kind: Sendable { case element, text }
    public var kind: Kind
    /// Lowercased local name (elements only).
    public var tag = ""
    public var id: String?
    public var classes: [String] = []
    public var epubType: String?
    public var href: String?
    public var role: String?
    /// `img` only.
    public var src: String?
    /// Text nodes only: whitespace runs already collapsed to one U+0020 (CSS `white-space: normal`).
    public var text = ""
    public var parent = -1, firstChild = -1, next = -1, prev = -1
}

public struct XHTMLError: Error, CustomStringConvertible {
    public let description: String
}

/// Flat DOM of a content document's `<body>` subtree.
public struct Document: Sendable {
    public private(set) var nodes: [Node] = []
    /// `href`s of `<head><link rel="stylesheet">`, in document order.
    public private(set) var stylesheets: [String] = []
    /// Index of `<body>` (always 0).
    public var body: Int { 0 }

    static let opsNamespace = "http://www.idpf.org/2007/ops"

    public init(data: Data) throws {
        guard String(data: data, encoding: .utf8) != nil else { throw XHTMLError(description: "content document is not UTF-8") }
        let options = Int32(XML_PARSE_NONET.rawValue | XML_PARSE_NOWARNING.rawValue | XML_PARSE_NOERROR.rawValue)
        let doc = data.withUnsafeBytes { raw in
            xmlReadMemory(raw.baseAddress!.assumingMemoryBound(to: CChar.self), Int32(raw.count), nil, "UTF-8", options)
        }
        guard let doc else { throw XHTMLError(description: "not well-formed XML") }
        defer { xmlFreeDoc(doc) }
        guard let root = xmlDocGetRootElement(doc), let body = Self.findBody(root) else {
            throw XHTMLError(description: "no <body>")
        }
        nodes.reserveCapacity(4096)
        var c = root.pointee.children
        while let h = c {
            if h.pointee.type == XML_ELEMENT_NODE, String(cString: h.pointee.name) == "head" {
                var l = h.pointee.children
                while let link = l {
                    if link.pointee.type == XML_ELEMENT_NODE, String(cString: link.pointee.name) == "link",
                       let rel = Self.attribute(link, "rel"), rel.lowercased().split(separator: " ").contains("stylesheet"),
                       let href = Self.attribute(link, "href") {
                        stylesheets.append(href)
                    }
                    l = link.pointee.next
                }
            }
            c = h.pointee.next
        }
        _ = append(body, parent: -1)
    }

    public init(contentsOf url: URL) throws {
        try self.init(data: Data(contentsOf: url))
    }

    private static func attribute(_ x: xmlNodePtr, _ name: String) -> String? {
        guard let p = xmlGetNoNsProp(x, name) else { return nil }
        defer { free(p) }
        return String(cString: p)
    }

    private static func findBody(_ root: xmlNodePtr) -> xmlNodePtr? {
        var c = root.pointee.children
        while let n = c {
            if n.pointee.type == XML_ELEMENT_NODE, String(cString: n.pointee.name) == "body" { return n }
            c = n.pointee.next
        }
        return nil
    }

    /// Appends `x` and its subtree; returns its index.
    private mutating func append(_ x: xmlNodePtr, parent: Int) -> Int {
        var node: Node
        switch x.pointee.type {
        case XML_ELEMENT_NODE:
            node = Node(kind: .element)
            node.tag = String(cString: x.pointee.name).lowercased()
            var a = x.pointee.properties
            while let attr = a {
                let name = String(cString: attr.pointee.name)
                let ns = attr.pointee.ns.flatMap { $0.pointee.href.map { String(cString: $0) } }
                let value = attr.pointee.children.flatMap { $0.pointee.content.map { String(cString: $0) } } ?? ""
                switch (ns, name) {
                case (nil, "id"): node.id = value
                case (nil, "class"): node.classes = value.split(separator: " ").map(String.init)
                case (nil, "href"): node.href = value
                case (nil, "role"): node.role = value
                case (nil, "src"): node.src = value
                case (Self.opsNamespace?, "type"): node.epubType = value
                default: break
                }
                a = attr.pointee.next
            }
        case XML_TEXT_NODE, XML_CDATA_SECTION_NODE:
            node = Node(kind: .text)
            node.text = x.pointee.content.map { Self.collapse(String(cString: $0)) } ?? ""
        default:
            return -1
        }
        node.parent = parent
        let index = nodes.count
        nodes.append(node)
        if node.kind == .element {
            var last = -1
            var c = x.pointee.children
            while let child = c {
                let k = append(child, parent: index)
                if k >= 0 {
                    if last < 0 { nodes[index].firstChild = k } else { nodes[last].next = k; nodes[k].prev = last }
                    last = k
                }
                c = child.pointee.next
            }
        }
        return index
    }

    static func collapse(_ s: String) -> String {
        var out = String.UnicodeScalarView()
        var space = false
        for u in s.unicodeScalars {
            if u == " " || u == "\t" || u == "\n" || u == "\r" {
                if !space { out.append(" "); space = true }
            } else {
                out.append(u); space = false
            }
        }
        return String(out)
    }

    // MARK: navigation

    public func children(_ i: Int) -> some Sequence<Int> {
        sequence(first: nodes[i].firstChild) { nodes[$0].next }.prefix { $0 >= 0 }
    }

    /// Previous sibling element, skipping text nodes.
    public func previousElement(_ i: Int) -> Int? {
        var k = nodes[i].prev
        while k >= 0 { if nodes[k].kind == .element { return k }; k = nodes[k].prev }
        return nil
    }

    /// Next sibling element, skipping text nodes.
    public func nextElement(_ i: Int) -> Int? {
        var k = nodes[i].next
        while k >= 0 { if nodes[k].kind == .element { return k }; k = nodes[k].next }
        return nil
    }

    public func hasAncestor(_ i: Int, tag: String) -> Bool {
        var k = nodes[i].parent
        while k >= 0 { if nodes[k].tag == tag { return true }; k = nodes[k].parent }
        return false
    }

    public func `is`(_ i: Int, _ tag: String, class cls: String? = nil) -> Bool {
        nodes[i].kind == .element && nodes[i].tag == tag && (cls.map { nodes[i].classes.contains($0) } ?? true)
    }

    public func isFootnote(_ i: Int) -> Bool {
        nodes[i].tag == "aside" && (nodes[i].epubType?.split(separator: " ").contains("footnote") ?? false)
    }

    public func isNoteref(_ i: Int) -> Bool {
        nodes[i].tag == "a" && (nodes[i].epubType?.split(separator: " ").contains("noteref") ?? false)
    }

    /// Concatenated text of a subtree.
    public func textContent(_ i: Int) -> String {
        if nodes[i].kind == .text { return nodes[i].text }
        return children(i).map { textContent($0) }.joined()
    }
}
