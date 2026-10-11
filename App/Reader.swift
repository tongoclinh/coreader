import AppKit
import CoReaderEngine

@objc(EPUBDocument)
final class EPUBDocument: NSDocument {
    var book: Book!

    override class var autosavesInPlace: Bool { false }
    override func read(from url: URL, ofType typeName: String) throws {
        do { book = try Trace.time("Book(url:) — ZIP directory, container, OPF, nav") { try Book(url: url) } } catch {
            let reason = "\(error)"
            throw NSError(domain: NSCocoaErrorDomain, code: NSFileReadCorruptFileError,
                          userInfo: [NSLocalizedDescriptionKey: "“\(url.lastPathComponent)” could not be opened.",
                                     NSLocalizedFailureReasonErrorKey: reason])
        }
    }
    override var displayName: String! {
        get { book.map { $0.title.isEmpty ? super.displayName : $0.title } ?? super.displayName }
        set { super.displayName = newValue }
    }

    override func makeWindowControllers() {
        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 620, height: 860),
                              styleMask: [.titled, .closable, .miniaturizable, .resizable], backing: .buffered, defer: false)
        window.minSize = NSSize(width: 300, height: 300)
        let view = ReaderView(document: self)
        Trace.mark("window created")
        window.contentView = view
        window.makeFirstResponder(view)
        window.center()
        let wc = NSWindowController(window: window)
        wc.shouldCascadeWindows = true
        addWindowController(wc)
        view.start()
    }

    var ignoreKey: String { "ignoreBookCSS." + book.identifier }
    var ignoreBookCSS: Bool { UserDefaults.standard.bool(forKey: ignoreKey) }

    @objc func editBookCSS(_ sender: Any?) { CSSFiles.edit(CSSFiles.book(book.identifier)) }
    @objc func toggleIgnoreBookCSS(_ sender: Any?) {
        UserDefaults.standard.set(!ignoreBookCSS, forKey: ignoreKey)
        NotificationCenter.default.post(name: .userCSSChanged, object: nil)
    }
    override func validateMenuItem(_ item: NSMenuItem) -> Bool {
        if item.action == #selector(toggleIgnoreBookCSS(_:)) { item.state = ignoreBookCSS ? .on : .off; return true }
        return super.validateMenuItem(item)
    }

    /// Global then per-book user CSS, then (unless ignored) the chapter's own CSS.
    func styler(for doc: CoReaderEngine.Document, path: String) throws -> Styler {
        let readFile: @Sendable (String) throws -> Data = { try Data(contentsOf: URL(fileURLWithPath: $0)) }
        var sources = [CSSFiles.global, CSSFiles.book(book.identifier)].compactMap { url -> StyleSource? in
            guard let data = try? Data(contentsOf: url) else { return nil }
            return StyleSource(sheet: Stylesheet(String(decoding: data, as: UTF8.self), base: url.path), origin: .user, load: readFile)
        }
        let book = self.book!
        if !ignoreBookCSS { sources += try Styler.bookSources(doc, path: path, load: { try book.data($0) }) }
        return Styler(sources: sources)
    }
}

final class ReaderView: NSView {
    unowned let document: EPUBDocument
    var book: Book { document.book }
    let margin: CGFloat = 40
    var spine = 0
    var chapter: Chapter?
    var paginator: Paginator?
    /// Pages laid out so far, contiguous from the chapter start; `tail` starts the next one (nil: chapter complete).
    var pages: [Page] = []
    var tail: PageStart?
    var pageIndex = 0
    /// Pages kept laid out past the current one, so a turn never waits on line breaking.
    let ahead = 3
    var backStack: [(spine: Int, block: Int, offset: Int)] = []
    var scrollAccum: CGFloat = 0
    var scrollTurned = false
    /// Position kept across relayouts so repeated resizes/CSS edits don't drift backwards; cleared by navigation.
    var anchor: (block: Int, offset: Int)?
    lazy var sizes = book.spine.map { book.size($0.path) }

    init(document: EPUBDocument) {
        self.document = document
        super.init(frame: NSRect(x: 0, y: 0, width: 620, height: 860))
        NotificationCenter.default.addObserver(self, selector: #selector(cssChanged), name: .userCSSChanged, object: nil)
    }
    required init?(coder: NSCoder) { fatalError() }

    override var acceptsFirstResponder: Bool { true }

    // MARK: layout

    var columnSize: CGSize { CGSize(width: max(bounds.width - 2 * margin, 50), height: max(bounds.height - 2 * margin, 50)) }

    /// Builds spine item `index`; nil when it fails or has no content.
    func layout(_ index: Int) -> (Chapter, Paginator)? {
        let path = book.spine[index].path
        let book = self.book
        do {
            let data = try Trace.time("  inflate \(path)") { try book.data(path) }
            let doc = try Trace.time("  XHTML parse (libxml2)") { try CoReaderEngine.Document(data: data) }
            let styler = try Trace.time("  CSS: parse book + user sheets") { try document.styler(for: doc, path: path) }
            let c = try Trace.time("  Chapter: cascade, fonts, attributed text") {
                try Chapter(document: doc, styler: styler, columnWidth: columnSize.width,
                            columnHeight: columnSize.height, path: path, load: { try book.data($0) })
            }
            guard !c.blocks.isEmpty else { return nil }
            return (c, Paginator(chapter: c, height: columnSize.height))
        } catch {
            NSLog("CoReader: \(path): \(error)")
            return nil
        }
    }

    /// Lays out pages until index `i` exists or the chapter ends.
    func extend(to i: Int) {
        while pages.count <= i, let s = tail, let p = paginator {
            let (page, next) = p.layoutPage(from: s)
            precondition(next != s, "pagination made no progress at \(s)")
            pages.append(page)
            tail = next
            if next == nil { Trace.mark("chapter paginated: \(pages.count) pages") }
        }
    }

    /// Shows spine item `index` at (block, offset), or at its last page when `last`. False when it has no content.
    @discardableResult
    func show(_ index: Int, block: Int = 0, offset: Int = 0, last: Bool = false) -> Bool {
        guard let (c, p) = layout(index) else { return false }
        spine = index; chapter = c; paginator = p; anchor = nil
        pages = []; tail = .chapterStart
        Trace.time("  paginate (line breaking, notes)") {
            if last { extend(to: .max); pageIndex = pages.count - 1; return }
            // Synchronous up to the target: page boundaries are always those of a full pagination.
            while let t = tail, (t.block, t.offset) <= (block, offset) { extend(to: pages.count) }
            pageIndex = pages.lastIndex { ($0.start.block, $0.start.offset) <= (block, offset) } ?? 0
            extend(to: pageIndex + ahead)
        }
        needsDisplay = true
        return true
    }

    /// Paginates the rest of the chapter on the main run loop in ≤ 8 ms slices, so the footer gets its count
    /// and far jumps are ready, without a second thread. Rescheduled after every draw until complete.
    @objc func paginateRest() {
        let end = DispatchTime.now().uptimeNanoseconds + 8_000_000
        while tail != nil, DispatchTime.now().uptimeNanoseconds < end { extend(to: pages.count) }
        if tail == nil { needsDisplay = true } else { perform(#selector(paginateRest), with: nil, afterDelay: 0) }
    }

    func start() {
        // Trace only: COREADER_TRACE_SPINE=N opens at spine item N (stands in for a saved position until P5).
        let from = Trace.on ? Int(ProcessInfo.processInfo.environment["COREADER_TRACE_SPINE"] ?? "") ?? 0 : 0
        _ = book.spine.indices.dropFirst(from).first { i in Trace.time("layout spine \(i)") { show(i) } }
    }

    func relayout() {
        guard chapter != nil else { return start() }
        let a = anchor ?? (pages[pageIndex].start.block, pages[pageIndex].start.offset)
        if show(spine, block: a.block, offset: a.offset) { anchor = a } else { start() }
    }

    @objc func cssChanged() { relayout() }
    override func viewDidEndLiveResize() { super.viewDidEndLiveResize(); relayout() }
    override func setFrameSize(_ newSize: NSSize) {
        let changed = newSize != frame.size
        super.setFrameSize(newSize)
        if changed && !inLiveResize && chapter != nil { relayout() }
    }
    override func viewDidChangeEffectiveAppearance() { needsDisplay = true }

    // MARK: navigation

    @objc func nextPage(_ sender: Any?) {
        extend(to: pageIndex + 1 + ahead)
        if pageIndex + 1 < pages.count { pageIndex += 1; anchor = nil; needsDisplay = true; return }
        _ = (spine + 1 ..< book.spine.count).first { show($0) }
    }
    @objc func previousPage(_ sender: Any?) {
        if pageIndex > 0 { pageIndex -= 1; anchor = nil; needsDisplay = true; return }
        _ = (0 ..< spine).reversed().first { show($0, last: true) }
    }
    @objc func goBack(_ sender: Any?) {
        guard let b = backStack.popLast() else { return NSSound.beep() }
        show(b.spine, block: b.block, offset: b.offset)
    }

    override func keyDown(with e: NSEvent) {
        switch e.keyCode {
        case 124: nextPage(nil)
        case 123: previousPage(nil)
        case 49: e.modifierFlags.contains(.shift) ? previousPage(nil) : nextPage(nil)
        default: super.keyDown(with: e)
        }
    }

    override func mouseUp(with e: NSEvent) {
        let p = convert(e.locationInWindow, from: nil)
        if let c = chapter, let href = pages[pageIndex].link(at: CGPoint(x: p.x - margin, y: bounds.height - p.y - margin), chapter: c) {
            return follow(href)
        }
        p.x < bounds.midX ? previousPage(nil) : nextPage(nil)
    }

    func follow(_ href: String) {
        if href.hasPrefix("http:") || href.hasPrefix("https:") {
            guard let url = URL(string: href) else { return }
            let alert = NSAlert()
            alert.messageText = "Open this link in your browser?"
            alert.informativeText = href
            alert.addButton(withTitle: "Open")
            alert.addButton(withTitle: "Cancel")
            alert.beginSheetModal(for: window!) { if $0 == .alertFirstButtonReturn { NSWorkspace.shared.open(url) } }
            return
        }
        let r = Book.resolve(href, against: book.spine[spine].path)
        guard let target = book.spineIndex(path: r.path) else { return NSSound.beep() }
        let here = (spine: spine, block: pages[pageIndex].start.block, offset: pages[pageIndex].start.offset)
        guard target == spine || show(target) else { return NSSound.beep() }
        if let f = r.fragment, let a = chapter?.anchors[f] { show(target, block: a.block, offset: a.offset) }
        backStack.append(here)
    }

    override func swipe(with e: NSEvent) {
        if e.deltaX < 0 { nextPage(nil) } else if e.deltaX > 0 { previousPage(nil) }
    }

    /// One page turn per two-finger horizontal gesture; momentum ignored.
    override func scrollWheel(with e: NSEvent) {
        guard e.momentumPhase == [] else { return }
        if e.phase == .began { scrollAccum = 0; scrollTurned = false }
        guard e.phase == .changed || e.phase == .began, !scrollTurned else { return }
        scrollAccum += e.scrollingDeltaX
        if abs(scrollAccum) > 40 {
            scrollTurned = true
            scrollAccum < 0 ? nextPage(nil) : previousPage(nil)
        }
    }

    // MARK: drawing

    var footer: String {
        func find(_ entries: [Book.TOCEntry]) -> String? {
            var hit: String?
            for e in entries {
                if let d = find(e.children) { return d }
                if hit == nil && e.path == book.spine[spine].path { hit = e.title }
            }
            return hit
        }
        let title = find(book.toc) ?? book.title
        let total = max(sizes.reduce(0, +), 1)
        let inChapter = Double(pages[pageIndex].start.block) / Double(chapter!.blocks.count)
        let done = Double(sizes[..<spine].reduce(0, +)) + Double(sizes[spine]) * inChapter
        let count = tail == nil ? "\(pages.count)" : "…"
        return "\(title) · \(pageIndex + 1)/\(count) · \(Int(done / Double(total) * 100))%"
    }

    var drawn = false
    override func draw(_ dirtyRect: NSRect) {
        Trace.time(drawn ? "draw" : "first draw (CoreText, images)") { drawPage() }
        if !drawn { drawn = true; DispatchQueue.main.async { Trace.mark("next runloop turn after first draw") } }
        if tail != nil {
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(paginateRest), object: nil)
            perform(#selector(paginateRest), with: nil, afterDelay: 0)
        }
    }

    func drawPage() {
        effectiveAppearance.performAsCurrentDrawingAppearance {
            NSColor.textBackgroundColor.setFill()
            bounds.fill()
            guard let c = chapter, let ctx = NSGraphicsContext.current?.cgContext else { return }
            let page = pages[pageIndex]
            let canvas = Canvas(context: ctx, width: bounds.width, height: bounds.height, scale: window?.backingScaleFactor ?? 2)
            let origin = CGPoint(x: margin, y: margin)
            canvas.draw(page.lines, chapter: c, origin: origin, color: NSColor.textColor.cgColor)
            if let t = page.separatorTop {
                canvas.drawSeparator(slotTop: t, slotHeight: c.noteLineHeight, columnWidth: c.columnWidth, origin: origin)
            }
            ctx.setFillColor(NSColor.secondaryLabelColor.cgColor)
            canvas.drawCentered(footer, font: NSFont.systemFont(ofSize: NSFont.smallSystemFontSize) as CTFont,
                                centerX: bounds.midX, baseline: bounds.height - margin / 2 + 4)
        }
    }
}
