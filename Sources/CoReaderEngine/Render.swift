import CoreGraphics
import CoreText
import Foundation
import ImageIO

/// Page geometry in pt (S7: 600×900 pt, 40 pt margins, rendered at 2x).
public struct PageGeometry: Sendable {
    public var width: CGFloat = 600
    public var height: CGFloat = 900
    public var margin: CGFloat = 40
    public var scale: CGFloat = 2
    public init() {}
    public var columnWidth: CGFloat { width - 2 * margin }
    public var columnHeight: CGFloat { height - 2 * margin }
}

/// Draws laid-out lines into a context. Coordinates passed in are y-down pt from the canvas top.
public final class Canvas {
    public let context: CGContext
    public let width: CGFloat
    public let height: CGFloat
    public let scale: CGFloat

    /// A 2x-style sRGB bitmap filled white (CLI renders and comparisons).
    public init(width: CGFloat, height: CGFloat, scale: CGFloat) {
        self.width = width; self.height = height; self.scale = scale
        context = CGContext(data: nil, width: Int((width * scale).rounded()), height: Int((height * scale).rounded()),
                            bitsPerComponent: 8, bytesPerRow: 0, space: CGColorSpace(name: CGColorSpace.sRGB)!,
                            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
        context.setFillColor(CGColor(gray: 1, alpha: 1))
        context.fill(CGRect(x: 0, y: 0, width: context.width, height: context.height))
        context.scaleBy(x: scale, y: scale)
        context.textMatrix = .identity
    }

    /// Wraps a y-up context of `height` pt (an unflipped view); `scale` is the backing scale for images.
    public init(context: CGContext, width: CGFloat, height: CGFloat, scale: CGFloat) {
        self.context = context; self.width = width; self.height = height; self.scale = scale
        context.textMatrix = .identity
    }

    /// Draws `lines` whose coordinates are relative to `origin` (the column's top-left corner).
    /// Each run is drawn with its own font (font fallback); `capColor` paints drop caps (comparisons only).
    public func draw(_ lines: [PlacedLine], chapter: Chapter, origin: CGPoint, color: CGColor = CGColor(gray: 0, alpha: 1),
                     capColor: CGColor? = nil) {
        for l in lines {
            if l.kind == .image {
                if let ref = chapter.blocks[l.source].image, let img = chapter.image(ref, scale: scale) {
                    context.draw(img, in: CGRect(x: origin.x + l.x, y: height - (origin.y + l.bottom), width: l.width, height: l.height))
                }
                continue
            }
            let text = l.kind == .note ? chapter.notes[l.source].block.text : chapter.blocks[l.source].text
            context.setFillColor(l.kind == .cap ? capColor ?? color : color)
            let baseY = height - (origin.y + l.baseline)
            var shift: CGFloat = 0
            for run in CTLineGetGlyphRuns(l.line) as! [CTRun] {
                let n = CTRunGetGlyphCount(run)
                guard n > 0 else { continue }
                let attrs = CTRunGetAttributes(run) as NSDictionary
                let font = attrs[kCTFontAttributeName] as! CTFont
                let raise = (attrs[raiseAttribute.rawValue] as? CGFloat) ?? 0
                var glyphs = [CGGlyph](repeating: 0, count: n)
                var pos = [CGPoint](repeating: .zero, count: n)
                var idx = [CFIndex](repeating: 0, count: n)
                CTRunGetGlyphs(run, CFRange(), &glyphs)
                CTRunGetPositions(run, CFRange(), &pos)
                CTRunGetStringIndices(run, CFRange(), &idx)
                for k in 0..<n {
                    pos[k].x += origin.x + l.x + shift
                    pos[k].y += baseY + raise
                    if l.spaceExtra != 0, idx[k] < l.justifyEnd, text.character(at: idx[k]) == 0x20 { shift += l.spaceExtra }
                }
                if let ref = attrs[imageAttribute.rawValue] as? ImageRef {
                    if let img = chapter.image(ref, scale: scale) {
                        context.draw(img, in: CGRect(origin: pos[0], size: ref.size))
                    }
                    continue
                }
                CTFontDrawGlyphs(font, glyphs, pos, n, context)
            }
        }
        context.setFillColor(color)
    }

    /// Footnote separator: 1/3 of the column, 0.5 pt thick, centred in its slot.
    public func drawSeparator(slotTop: CGFloat, slotHeight: CGFloat, columnWidth: CGFloat, origin: CGPoint) {
        let y = origin.y + slotTop + slotHeight / 2
        context.fill(CGRect(x: origin.x, y: height - y - 0.25, width: columnWidth / 3, height: 0.5))
    }

    /// Small centred text (page footer), in the context's fill colour.
    public func drawCentered(_ s: String, font: CTFont, centerX: CGFloat, baseline: CGFloat) {
        let attrs: [NSAttributedString.Key: Any] = [fontAttribute: font, NSAttributedString.Key(kCTForegroundColorFromContextAttributeName as String): true]
        let line = CTLineCreateWithAttributedString(NSAttributedString(string: s, attributes: attrs))
        let w = CGFloat(CTLineGetTypographicBounds(line, nil, nil, nil))
        context.textPosition = CGPoint(x: centerX - w / 2, y: height - baseline)
        CTLineDraw(line, context)
    }

    public func strokeGuide(y: CGFloat, from x0: CGFloat, to x1: CGFloat, color: CGColor) {
        context.setStrokeColor(color)
        context.setLineWidth(0.5)
        context.strokeLineSegments(between: [CGPoint(x: x0, y: height - y), CGPoint(x: x1, y: height - y)])
    }

    public func image() -> CGImage { context.makeImage()! }

    public func writePNG(to url: URL) throws {
        try Canvas.writePNG(image(), to: url, scale: scale)
    }

    public static func writePNG(_ image: CGImage, to url: URL, scale: CGFloat) throws {
        try FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
        guard let dest = CGImageDestinationCreateWithURL(url as CFURL, "public.png" as CFString, 1, nil) else {
            throw FontError(description: "cannot write \(url.path)")
        }
        CGImageDestinationAddImage(dest, image, [kCGImagePropertyDPIWidth: 72 * scale, kCGImagePropertyDPIHeight: 72 * scale] as CFDictionary)
        guard CGImageDestinationFinalize(dest) else { throw FontError(description: "cannot write \(url.path)") }
    }
}


extension Page {
    /// `href` of the link under `point` (column coordinates, y-down), if any.
    public func link(at point: CGPoint, chapter: Chapter) -> String? {
        for l in lines where (l.kind == .body || l.kind == .note) && point.y >= l.top && point.y < l.bottom {
            let b = l.kind == .note ? chapter.notes[l.source].block : chapter.blocks[l.source]
            guard let i = l.index(atX: point.x, text: b.text) else { return nil }
            return b.string.attribute(linkAttribute, at: i, effectiveRange: nil) as? String
        }
        return nil
    }
}

extension PlacedLine {
    /// UTF-16 index of the glyph under column x, following the draw path's space widening.
    func index(atX x: CGFloat, text: NSString) -> Int? {
        var shift: CGFloat = 0
        for run in CTLineGetGlyphRuns(line) as! [CTRun] {
            let n = CTRunGetGlyphCount(run)
            guard n > 0 else { continue }
            var pos = [CGPoint](repeating: .zero, count: n)
            var adv = [CGSize](repeating: .zero, count: n)
            var idx = [CFIndex](repeating: 0, count: n)
            CTRunGetPositions(run, CFRange(), &pos)
            CTRunGetAdvances(run, CFRange(), &adv)
            CTRunGetStringIndices(run, CFRange(), &idx)
            for k in 0..<n {
                let x0 = self.x + pos[k].x + shift
                if x >= x0 && x < x0 + adv[k].width { return idx[k] }
                if spaceExtra != 0, idx[k] < justifyEnd, text.character(at: idx[k]) == 0x20 { shift += spaceExtra }
            }
        }
        return nil
    }

    /// Pen advance from the line start to the end of its justifiable part, following the draw path's
    /// space widening. Used by `--check` to prove justified lines fill their width.
    public func drawnWidth(text: NSString) -> CGFloat {
        var shift: CGFloat = 0
        var end: CGFloat = 0
        for run in CTLineGetGlyphRuns(line) as! [CTRun] {
            let n = CTRunGetGlyphCount(run)
            guard n > 0 else { continue }
            var pos = [CGPoint](repeating: .zero, count: n)
            var adv = [CGSize](repeating: .zero, count: n)
            var idx = [CFIndex](repeating: 0, count: n)
            CTRunGetPositions(run, CFRange(), &pos)
            CTRunGetAdvances(run, CFRange(), &adv)
            CTRunGetStringIndices(run, CFRange(), &idx)
            for k in 0..<n {
                if idx[k] < justifyEnd { end = max(end, pos[k].x + shift + adv[k].width) }
                if spaceExtra != 0, idx[k] < justifyEnd, text.character(at: idx[k]) == 0x20 { shift += spaceExtra }
            }
        }
        return end
    }
}