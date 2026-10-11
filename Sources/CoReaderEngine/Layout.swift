import CoreText
import Foundation

public enum LineKind: String, Codable, Sendable { case body, cap, note, image }

/// A laid-out line. Coordinates are in pt relative to the column's top-left corner.
public struct PlacedLine {
    public let kind: LineKind
    /// Block index (body, cap) or note index (note).
    public let source: Int
    /// UTF-16 range in the block or note string.
    public let location: Int
    public let length: Int
    /// Pen x of the first glyph.
    public let x: CGFloat
    public let baseline: CGFloat
    /// Line-box top and height (`line-height`).
    public let top: CGFloat
    public let height: CGFloat
    /// Available width (justification target).
    public let width: CGFloat
    /// Extra advance added after each justifiable U+0020 (0 = not justified).
    public let spaceExtra: CGFloat
    /// UTF-16 end of the justifiable part (trailing spaces excluded).
    public let justifyEnd: Int
    /// Ascent of the block's primary font (WebKit text-rect top = baseline − ascent).
    public let ascent: CGFloat
    /// True when a drop-cap exclusion shortened the line.
    public let excluded: Bool
    public let line: CTLine

    public var bottom: CGFloat { top + height }
}

/// Area kept clear for a drop cap, in column coordinates.
public struct Exclusion: Sendable {
    public var right: CGFloat
    public var bottom: CGFloat
}

/// Position in the body flow.
public struct FlowState {
    public var block: Int
    public var offset: Int
    public var y: CGFloat
    public var exclusion: Exclusion?
    /// The next block start is the first thing on a page after an unforced break: its margin is truncated.
    public var truncateMargin: Bool
}

/// One body step: a line, plus the drop cap when the line starts a drop-cap paragraph.
public struct FlowStep {
    public var lines: [PlacedLine]
    public var next: FlowState
    public var bottom: CGFloat
    /// Notes whose first ref falls inside this line.
    public var notes: [Int]
    /// Set when the step starts a drop-cap paragraph: its top and the height its cap needs.
    public var capStart: (paraTop: CGFloat, need: CGFloat)?
}

public struct LineLayout {
    public let chapter: Chapter
    private let refsByBlock: [Int: [NoteRef]]

    public init(chapter: Chapter) {
        self.chapter = chapter
        self.refsByBlock = Dictionary(grouping: chapter.refs, by: \.block)
    }

    /// Lays out the next body line after `s`; nil at the end of the chapter.
    public func step(_ s: FlowState) -> FlowStep? {
        var st = s
        while st.block < chapter.blocks.count, st.offset >= chapter.blocks[st.block].length { st.block += 1; st.offset = 0 }
        guard st.block < chapter.blocks.count else { return nil }
        let b = chapter.blocks[st.block]
        var lines: [PlacedLine] = []
        var y = st.y
        if st.offset == 0, !st.truncateMargin { y += b.spaceBefore }
        st.truncateMargin = false
        if let e = st.exclusion, y >= e.bottom { st.exclusion = nil }

        if let img = b.image {
            // One box, never split; placed by the container's text-align.
            let room = chapter.columnWidth - b.insetLeft - b.insetRight - img.size.width
            let x = b.insetLeft + (b.align == .center ? room / 2 : b.align == .right ? room : 0)
            let placed = PlacedLine(kind: .image, source: st.block, location: 0, length: 1, x: x, baseline: y + img.size.height,
                                    top: y, height: img.size.height, width: img.size.width, spaceExtra: 0, justifyEnd: 1,
                                    ascent: img.size.height, excluded: false, line: CTTypesetterCreateLine(b.typesetter, CFRange(location: 0, length: 1)))
            var next = st
            next.block += 1; next.offset = 0; next.y = placed.bottom
            if let e = next.exclusion, next.y >= e.bottom { next.exclusion = nil }
            return FlowStep(lines: [placed], next: next, bottom: next.y, notes: [], capStart: nil)
        }

        var start = st.offset
        var lineTop = y
        var capStart: (CGFloat, CGFloat)?
        if st.offset == 0, let cap = b.dropCap {
            let n = cap.rule.size, m = cap.rule.sink, lh = b.lineHeight
            // §7.6.1. A cap taller than its sink moves the text down (n − m) lines, as WebKit does.
            let push = n > m ? CGFloat(n - m) * lh : 0
            lineTop = y + push
            let baseline1 = lineTop + b.baselineOffset
            let capBaseline = n >= m ? baseline1 + CGFloat(m - 1) * lh : baseline1 - b.capHeight + cap.capHeight
            lines.append(PlacedLine(kind: .cap, source: st.block, location: 0, length: cap.length, x: b.insetLeft,
                                    baseline: capBaseline, top: y, height: capBaseline - cap.ink.minY - y,
                                    width: cap.advance, spaceExtra: 0, justifyEnd: cap.length,
                                    ascent: CTFontGetAscent(cap.font), excluded: false, line: cap.line))
            // S4: WebKit box — advance width + margin-right, side bearing kept.
            st.exclusion = Exclusion(right: b.insetLeft + cap.advance + cap.rule.marginRight, bottom: capBaseline - cap.ink.minY)
            start = cap.length
            // §7.8.1: white space after the cap collapses away.
            while start < b.length, b.text.character(at: start) == 0x20 { start += 1 }
            capStart = (y, max(push + CGFloat(m) * lh, capBaseline - cap.ink.minY - y))
        }

        var x = b.insetLeft
        var excluded = false
        if let e = st.exclusion, lineTop < e.bottom { x = max(x, e.right); excluded = true }
        if st.offset == 0 { x += b.indent }
        let width = chapter.columnWidth - b.insetRight - x
        let placed = Self.line(b, kind: .body, source: st.block, start: start, x: x, top: lineTop, width: width, excluded: excluded)
        lines.append(placed)

        let end = placed.location + placed.length
        let notes = (refsByBlock[st.block] ?? []).filter { $0.offset >= st.offset && $0.offset < end }.map(\.note)
        var next = st
        next.y = lineTop + b.lineHeight
        next.offset = end
        if end >= b.length { next.block += 1; next.offset = 0 }
        if let e = next.exclusion, next.y >= e.bottom { next.exclusion = nil }
        return FlowStep(lines: lines, next: next, bottom: next.y, notes: notes, capStart: capStart)
    }

    /// Breaks and positions one line of `b` starting at `start`.
    static func line(_ b: TextBlock, kind: LineKind, source: Int, start: Int, x: CGFloat, top: CGFloat, width: CGFloat, excluded: Bool) -> PlacedLine {
        let count = max(1, CTTypesetterSuggestLineBreak(b.typesetter, start, Double(width)))
        let ctLine = CTTypesetterCreateLine(b.typesetter, CFRange(location: start, length: count))
        let end = start + count
        var trimmed = end
        while trimmed > start, [0x20, 0x2028, 0x2029].contains(b.text.character(at: trimmed - 1)) { trimmed -= 1 }
        let forced = [0x2028, 0x2029].contains(b.text.character(at: end - 1))
        var spaces = 0
        for k in start..<trimmed where b.text.character(at: k) == 0x20 { spaces += 1 }
        let natural = CGFloat(CTLineGetTypographicBounds(ctLine, nil, nil, nil) - CTLineGetTrailingWhitespaceWidth(ctLine))
        // S2: widen U+0020 only; never last lines, forced breaks or lines without spaces.
        let justify = b.align == .justify && end < b.length && !forced && spaces > 0
        let extra = justify ? (width - natural) / CGFloat(spaces) : 0
        let penX = switch b.align {
        case .center: x + (width - natural) / 2
        case .right: x + width - natural
        case .left, .justify: x
        }
        return PlacedLine(kind: kind, source: source, location: start, length: count, x: penX,
                          baseline: top + b.baselineOffset, top: top, height: b.lineHeight, width: width,
                          spaceExtra: extra, justifyEnd: trimmed, ascent: b.ascent, excluded: excluded, line: ctLine)
    }

    /// Phase-1 tall column: every body line of the chapter, never paginated.
    public func tallColumn() -> [PlacedLine] {
        var out: [PlacedLine] = []
        var s = FlowState(block: 0, offset: 0, y: 0, exclusion: nil, truncateMargin: false)
        while let st = step(s) { out += st.lines; s = st.next }
        return out
    }
}

// MARK: - Pagination

public struct NoteCursor: Codable, Equatable, Sendable {
    public var note: Int
    public var offset: Int
}

/// Everything needed to lay out a page in a fresh process.
public struct PageStart: Codable, Equatable, Sendable {
    /// Block index; `blocks.count` means the body is finished and only notes remain.
    public var block: Int
    /// UTF-16 offset relative to the block, including the first letter.
    public var offset: Int
    public var pendingNotes: [NoteCursor]
    public static let chapterStart = PageStart(block: 0, offset: 0, pendingNotes: [])
}

public struct Page {
    public var start: PageStart
    /// Body lines and caps, then note lines.
    public var lines: [PlacedLine]
    /// Top of the separator slot (one note line-height), nil without notes.
    public var separatorTop: CGFloat?
}

public struct Paginator {
    public let layout: LineLayout
    public let height: CGFloat
    var chapter: Chapter { layout.chapter }

    public init(chapter: Chapter, height: CGFloat) {
        self.layout = LineLayout(chapter: chapter)
        self.height = height
    }

    /// Depends only on (chapter, style, geometry, start).
    public func layoutPage(from start: PageStart) -> (page: Page, next: PageStart?) {
        let nlh = chapter.noteLineHeight
        let width = chapter.columnWidth
        func remaining(_ c: NoteCursor) -> Int {
            let starts = chapter.notes[c.note].lineStarts(width: width)
            return starts.count - (starts.firstIndex(of: c.offset) ?? starts.count)
        }
        func reservation(_ notes: [Int]) -> Int { notes.reduce(0) { $0 + min(2, remaining(NoteCursor(note: $1, offset: 0))) } }

        // Pass 1: fill the body.
        let carriedLines = start.pendingNotes.reduce(0) { $0 + remaining($1) }
        var reserve = carriedLines > 0 ? min(CGFloat(carriedLines + 1) * nlh, height - chapter.bodyLineHeight) : 0
        var hasNoteLines = carriedLines > 0
        // A forced break keeps the margin of the block it starts; an unforced one truncates it.
        let forcedStart = start.offset == 0 && start.block < chapter.blocks.count && chapter.blocks[start.block].breakBefore
        var state = FlowState(block: start.block, offset: start.offset, y: 0, exclusion: nil,
                              truncateMargin: !(start.block == 0 && start.offset == 0) && !forcedStart)
        var steps: [FlowStep] = []
        var bodyDone = false
        var forced = false
        let eps: CGFloat = 0.001
        while true {
            guard let st = layout.step(state) else { bodyDone = true; break }
            if !steps.isEmpty, state.offset == 0, chapter.blocks[st.lines[0].source].breakBefore { forced = true; break }
            let lines = reservation(st.notes)
            var need = CGFloat(lines) * nlh
            if lines > 0 && !hasNoteLines { need += nlh }
            var fits = st.bottom + reserve + need <= height + eps
            if let cap = st.capStart, !steps.isEmpty {
                // The cap's height must fit with the reservations of every line beside it.
                var total = lines
                var la = st.next
                while let s2 = layout.step(la), s2.lines[0].source == st.lines[0].source, s2.lines[0].top < cap.paraTop + cap.need {
                    total += reservation(s2.notes)
                    la = s2.next
                }
                let sep: CGFloat = total > 0 && !hasNoteLines ? nlh : 0
                fits = fits && cap.paraTop + cap.need + reserve + CGFloat(total) * nlh + sep <= height + eps
            }
            // Progress: the first body line of a page is always placed.
            if !fits && !steps.isEmpty { break }
            steps.append(st)
            reserve += need
            if lines > 0 { hasNoteLines = true }
            state = st.next
        }
        if !bodyDone, !forced, layout.step(state) == nil { bodyDone = true }

        // Cut-back (§8): only removes steps, so the notes of the kept steps still fit. Step 0 always stays.
        if !bodyDone && !forced {
            func block(_ k: Int) -> Int { steps[k].lines[steps[k].lines.count - 1].source }
            var k = steps.count
            // Widows and orphans: a block split by the break keeps at least 2 lines on each side.
            if state.offset > 0 {
                let b = state.block
                let on = steps.reversed().prefix { $0.lines.last!.source == b }.count
                var rest = 0
                var s = FlowState(block: b, offset: state.offset, y: 0, exclusion: nil, truncateMargin: true)
                while rest < 2, let x = layout.step(s), x.lines.last!.source == b { rest += 1; s = x.next }
                if rest == 1 && on >= 3 { k -= 1 } else if (rest == 1 || on < 2) && on < k { k -= on }
            }
            // A heading is never the last block of a page.
            while k > 1, chapter.blocks[block(k - 1)].keepWithNext {
                var j = k - 1
                while j > 0, block(j - 1) == block(k - 1) { j -= 1 }
                if j == 0 { break }
                k = j
            }
            if k < steps.count { state = steps[k - 1].next; steps.removeLast(steps.count - k) }
        }
        let body = steps.flatMap(\.lines)
        let newNotes = steps.flatMap(\.notes)
        let bodyBottom = steps.last?.bottom ?? 0

        // Pass 2: fill notes, carried ones first, then new ones in first-ref order. A note never eats the
        // min(2) lines reserved for the notes after it, so every note starts on its ref's page (§8).
        let cursors = start.pendingNotes + newNotes.map { NoteCursor(note: $0, offset: 0) }
        var noteLines: [(note: Int, start: Int)] = []
        var pending: [NoteCursor] = []
        if !cursors.isEmpty {
            var capacity = Int(((height - bodyBottom - nlh) / nlh + eps).rounded(.down))
            var later = cursors.reduce(0) { $0 + min(2, remaining($1)) }
            for c in cursors {
                let starts = chapter.notes[c.note].lineStarts(width: width)
                let first = starts.firstIndex(of: c.offset) ?? 0
                later -= min(2, starts.count - first)
                let take = max(0, min(starts.count - first, capacity - later))
                for k in first..<(first + take) { noteLines.append((c.note, starts[k])) }
                capacity -= take
                if first + take < starts.count { pending.append(NoteCursor(note: c.note, offset: starts[first + take])) }
            }
        }
        var lines = body
        var separatorTop: CGFloat?
        if !noteLines.isEmpty {
            let noteTop = height - CGFloat(noteLines.count) * nlh
            separatorTop = noteTop - nlh
            for (k, nl) in noteLines.enumerated() {
                let b = chapter.notes[nl.note].block
                lines.append(LineLayout.line(b, kind: .note, source: nl.note, start: nl.start, x: 0,
                                             top: noteTop + CGFloat(k) * nlh, width: width, excluded: false))
            }
        }
        let next: PageStart? = bodyDone && pending.isEmpty
            ? nil
            : PageStart(block: bodyDone ? chapter.blocks.count : state.block, offset: bodyDone ? 0 : state.offset, pendingNotes: pending)
        return (Page(start: start, lines: lines, separatorTop: separatorTop), next)
    }

    public func paginate() -> [Page] {
        var pages: [Page] = []
        var start: PageStart? = .chapterStart
        while let s = start {
            let (page, next) = layoutPage(from: s)
            precondition(next != s, "pagination made no progress at \(s)")
            pages.append(page)
            start = next
        }
        return pages
    }
}
