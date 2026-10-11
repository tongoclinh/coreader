import AppKit
import UniformTypeIdentifiers

extension Notification.Name { static let userCSSChanged = Notification.Name("CoReaderUserCSSChanged") }

/// Open-time trace, on when `COREADER_TRACE` is set: ms since the process started, to stderr.
/// `open --env COREADER_TRACE=1 --stderr /tmp/trace.txt -a CoReader.app book.epub`
enum Trace {
    static let on = ProcessInfo.processInfo.environment["COREADER_TRACE"] != nil
    static let processStart: Double = {
        var info = kinfo_proc(), size = MemoryLayout<kinfo_proc>.size
        var mib: [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        sysctl(&mib, 4, &info, &size, nil, 0)
        return Double(info.kp_proc.p_starttime.tv_sec) + Double(info.kp_proc.p_starttime.tv_usec) / 1e6
    }()
    static func now() -> Double { Date().timeIntervalSince1970 }
    static func mark(_ label: String) {
        guard on else { return }
        FileHandle.standardError.write(String(format: "%8.1f ms          %@\n", (now() - processStart) * 1000, label).data(using: .utf8)!)
    }
    /// Runs `body`; logs when it ended and how long it took.
    static func time<T>(_ label: String, _ body: () throws -> T) rethrows -> T {
        guard on else { return try body() }
        let t = now()
        defer {
            FileHandle.standardError.write(String(format: "%8.1f ms %7.1f  %@\n", (now() - processStart) * 1000, (now() - t) * 1000, label).data(using: .utf8)!)
        }
        return try body()
    }
}

/// `~/Library/Application Support/CoReader` and its `books/` folder.
enum CSSFiles {
    static let dir = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0].appendingPathComponent("CoReader")
    static let books = dir.appendingPathComponent("books")
    static let global = dir.appendingPathComponent("user.css")
    static func book(_ identifier: String) -> URL {
        let name = String(identifier.unicodeScalars.map { CharacterSet.alphanumerics.contains($0) ? Character($0) : "_" })
        return books.appendingPathComponent(name + ".css")
    }
    /// Creates the file empty if missing and opens it in the default text editor.
    static func edit(_ url: URL) {
        if !FileManager.default.fileExists(atPath: url.path) { FileManager.default.createFile(atPath: url.path, contents: Data()) }
        if let app = NSWorkspace.shared.urlForApplication(toOpen: .plainText) {
            NSWorkspace.shared.open([url], withApplicationAt: app, configuration: NSWorkspace.OpenConfiguration())
        } else {
            NSWorkspace.shared.open(url)
        }
    }
}

final class AppDelegate: NSObject, NSApplicationDelegate {
    var stamp: [Date] = []

    func applicationWillFinishLaunching(_ note: Notification) { Trace.mark("applicationWillFinishLaunching") }
    func applicationDidFinishLaunching(_ note: Notification) {
        Trace.mark("applicationDidFinishLaunching")
        try? FileManager.default.createDirectory(at: CSSFiles.books, withIntermediateDirectories: true)
        // ponytail: 1 s poll of the CSS files' mtimes; catches in-place and atomic saves alike. FSEvents if it ever matters.
        stamp = cssStamp()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [unowned self] _ in
            let s = cssStamp()
            if s != stamp { stamp = s; NotificationCenter.default.post(name: .userCSSChanged, object: nil) }
        }
    }

    func cssStamp() -> [Date] {
        let files = [CSSFiles.global] + ((try? FileManager.default.contentsOfDirectory(at: CSSFiles.books, includingPropertiesForKeys: nil)) ?? [])
        return files.sorted { $0.path < $1.path }.map {
            ((try? FileManager.default.attributesOfItem(atPath: $0.path)[.modificationDate]) as? Date) ?? .distantPast
        }
    }

    func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool { false }

    @objc func editUserCSS(_ sender: Any?) { CSSFiles.edit(CSSFiles.global) }
}

func buildMenu() -> NSMenu {
    let main = NSMenu()
    func sub(_ title: String, _ items: [NSMenuItem]) -> NSMenu {
        let m = NSMenu(title: title)
        items.forEach(m.addItem)
        let host = NSMenuItem(title: title, action: nil, keyEquivalent: "")
        host.submenu = m
        main.addItem(host)
        return m
    }
    func item(_ t: String, _ a: Selector?, _ k: String = "", _ mods: NSEvent.ModifierFlags = .command) -> NSMenuItem {
        let i = NSMenuItem(title: t, action: a, keyEquivalent: k)
        i.keyEquivalentModifierMask = mods
        return i
    }
    _ = sub("CoReader", [item("Edit User CSS…", #selector(AppDelegate.editUserCSS(_:))), .separator(),
                         item("Hide CoReader", #selector(NSApplication.hide(_:)), "h"),
                         item("Quit CoReader", #selector(NSApplication.terminate(_:)), "q")])
    let recent = NSMenu(title: "Open Recent")
    recent.addItem(item("Clear Menu", #selector(NSDocumentController.clearRecentDocuments(_:))))
    let recentItem = item("Open Recent", nil)
    recentItem.submenu = recent
    _ = sub("File", [item("Open…", #selector(NSDocumentController.openDocument(_:)), "o"), recentItem, .separator(),
                     item("Close", #selector(NSWindow.performClose(_:)), "w")])
    _ = sub("Edit", [item("Copy", #selector(NSText.copy(_:)), "c")])
    _ = sub("Book", [item("Edit Book CSS…", #selector(EPUBDocument.editBookCSS(_:))),
                     item("Ignore Book CSS", #selector(EPUBDocument.toggleIgnoreBookCSS(_:)))])
    _ = sub("Go", [item("Back", #selector(ReaderView.goBack(_:)), "[")])
    NSApp.windowsMenu = sub("Window", [item("Minimize", #selector(NSWindow.performMiniaturize(_:)), "m")])
    return main
}

Trace.mark(String(format: "main (process started at wall %.3f)", Trace.processStart))
let app = Trace.time("NSApplication.shared") { NSApplication.shared }
let delegate = AppDelegate()
app.delegate = delegate
app.mainMenu = Trace.time("buildMenu") { buildMenu() }
app.setActivationPolicy(.regular)
app.run()
