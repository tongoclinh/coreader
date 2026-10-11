import Compression
import Foundation

public struct ZipError: Error, CustomStringConvertible {
    public let description: String
}

/// ZIP read in place: the file is mmapped, the central directory parsed once, entries inflated on demand.
/// ponytail: no ZIP64 (EPUB novels are far below 4 GB); CRC not checked.
public struct Zip: Sendable {
    public struct Entry: Sendable {
        let method: UInt16
        let flags: UInt16
        let compressedSize: Int
        let size: Int
        let localHeader: Int
        public var encrypted: Bool { flags & 1 != 0 }
    }

    let data: Data
    public private(set) var entries: [String: Entry] = [:]

    public init(url: URL) throws {
        try self.init(data: Data(contentsOf: url, options: .alwaysMapped))
    }

    public init(data: Data) throws {
        self.data = data
        let n = data.count
        // End of central directory: 22 bytes + comment (≤ 64 KiB), scanned from the end.
        var eocd = -1
        var i = n - 22
        while i >= max(0, n - 22 - 0xFFFF) {
            if u32(i) == 0x0605_4B50 { eocd = i; break }
            i -= 1
        }
        guard eocd >= 0 else { throw ZipError(description: "not a ZIP file") }
        let count = Int(u16(eocd + 10))
        var p = Int(u32(eocd + 16))
        entries.reserveCapacity(count)
        for _ in 0..<count {
            guard p + 46 <= n, u32(p) == 0x0201_4B50 else { throw ZipError(description: "corrupt central directory") }
            let nameLen = Int(u16(p + 28)), extraLen = Int(u16(p + 30)), commentLen = Int(u16(p + 32))
            guard p + 46 + nameLen <= n else { throw ZipError(description: "corrupt central directory") }
            let name = String(decoding: data[(p + 46)..<(p + 46 + nameLen)], as: UTF8.self)
            entries[name] = Entry(method: u16(p + 10), flags: u16(p + 8), compressedSize: Int(u32(p + 20)),
                                  size: Int(u32(p + 24)), localHeader: Int(u32(p + 42)))
            p += 46 + nameLen + extraLen + commentLen
        }
    }

    public func contains(_ path: String) -> Bool { entries[path] != nil }

    public func read(_ path: String) throws -> Data {
        guard let e = entries[path] else { throw ZipError(description: "missing entry \(path)") }
        guard !e.encrypted else { throw ZipError(description: "encrypted entry \(path)") }
        let h = e.localHeader
        guard h + 30 <= data.count, u32(h) == 0x0403_4B50 else { throw ZipError(description: "bad local header \(path)") }
        let start = h + 30 + Int(u16(h + 26)) + Int(u16(h + 28))
        guard start + e.compressedSize <= data.count else { throw ZipError(description: "truncated entry \(path)") }
        let raw = data[(data.startIndex + start)..<(data.startIndex + start + e.compressedSize)]
        switch e.method {
        case 0: return Data(raw)
        case 8:
            if e.size == 0 { return Data() }
            var out = Data(count: e.size)
            let written = out.withUnsafeMutableBytes { dst in
                raw.withUnsafeBytes { src in
                    compression_decode_buffer(dst.baseAddress!.assumingMemoryBound(to: UInt8.self), e.size,
                                              src.baseAddress!.assumingMemoryBound(to: UInt8.self), e.compressedSize,
                                              nil, COMPRESSION_ZLIB)
                }
            }
            guard written == e.size else { throw ZipError(description: "inflate failed \(path)") }
            return out
        default: throw ZipError(description: "unsupported compression \(e.method) in \(path)")
        }
    }

    private func u16(_ o: Int) -> UInt16 {
        data.withUnsafeBytes { UInt16(littleEndian: $0.loadUnaligned(fromByteOffset: o, as: UInt16.self)) }
    }

    private func u32(_ o: Int) -> UInt32 {
        data.withUnsafeBytes { UInt32(littleEndian: $0.loadUnaligned(fromByteOffset: o, as: UInt32.self)) }
    }
}
