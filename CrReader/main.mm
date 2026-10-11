// CrReader: the CoReader app shell (App/) rebuilt on KOReader's crengine, for comparison only.
// Same window, margins, defaults, navigation, footer and user-CSS files; crengine lays out the whole book.
#import <AppKit/AppKit.h>
#import <CoreText/CoreText.h>
#import <UniformTypeIdentifiers/UniformTypeIdentifiers.h>
#include <sys/sysctl.h>
#include <functional>
#include <vector>
#include "crengine.h"

// MARK: trace (same output as CoReader's `Trace`)

static const bool traceOn = getenv("COREADER_TRACE") != nullptr;
static double nowSec() { return NSDate.date.timeIntervalSince1970; }
static double processStart() {
    static double t = [] {
        struct kinfo_proc info; size_t size = sizeof info;
        int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()};
        sysctl(mib, 4, &info, &size, nullptr, 0);
        return info.kp_proc.p_starttime.tv_sec + info.kp_proc.p_starttime.tv_usec / 1e6;
    }();
    return t;
}
static void mark(NSString *label) {
    if (traceOn) fprintf(stderr, "%8.1f ms          %s\n", (nowSec() - processStart()) * 1000, label.UTF8String);
}
template <typename F> static auto timed(NSString *label, F body) {
    double t = nowSec();
    struct Done { NSString *l; double t; ~Done() {
        if (traceOn) fprintf(stderr, "%8.1f ms %7.1f  %s\n", (nowSec() - processStart()) * 1000, (nowSec() - t) * 1000, l.UTF8String);
    } } done{label, t};
    return body();
}

// MARK: strings, files

static lString32 U(NSString *s) { return Utf8ToUnicode(lString8(s.UTF8String)); }
static NSString *NS(const lString32 &s) { return [NSString stringWithUTF8String:UnicodeToUtf8(s).c_str()]; }

static NSString *const userCSSChanged = @"CrReaderUserCSSChanged";
static NSURL *supportDir() {
    return [[NSFileManager.defaultManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask][0]
            URLByAppendingPathComponent:@"CrReader"];
}
static NSURL *booksDir() { return [supportDir() URLByAppendingPathComponent:@"books"]; }
static NSURL *globalCSS() { return [supportDir() URLByAppendingPathComponent:@"user.css"]; }
static NSURL *bookCSS(NSString *identifier) {
    NSMutableString *name = [NSMutableString string];
    [identifier enumerateSubstringsInRange:NSMakeRange(0, identifier.length) options:NSStringEnumerationByComposedCharacterSequences
                                usingBlock:^(NSString *c, NSRange, NSRange, BOOL *) {
        [name appendString:[c rangeOfCharacterFromSet:NSCharacterSet.alphanumericCharacterSet.invertedSet].location == NSNotFound ? c : @"_"];
    }];
    return [booksDir() URLByAppendingPathComponent:[name stringByAppendingString:@".css"]];
}
static NSString *readText(NSURL *url) { return [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil] ?: @""; }
static void editFile(NSURL *url) {
    if (![NSFileManager.defaultManager fileExistsAtPath:url.path]) [NSData.data writeToURL:url atomically:YES];
    NSURL *app = [NSWorkspace.sharedWorkspace URLForApplicationToOpenContentType:UTTypePlainText];
    if (app) [NSWorkspace.sharedWorkspace openURLs:@[url] withApplicationAtURL:app configuration:NSWorkspaceOpenConfiguration.configuration completionHandler:nil];
    else [NSWorkspace.sharedWorkspace openURL:url];
}

// MARK: engine setup

/// Registers every face of an installed family with crengine, by file (no system-wide font scan).
static void registerFamily(NSString *family) {
    static NSMutableSet<NSString *> *done = [NSMutableSet set];
    NSDictionary *attrs = @{(id)kCTFontFamilyNameAttribute: family};
    CTFontDescriptorRef d = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)attrs);
    NSArray *matches = CFBridgingRelease(CTFontDescriptorCreateMatchingFontDescriptors(d, nullptr));
    CFRelease(d);
    for (id m in matches) {
        NSURL *url = CFBridgingRelease(CTFontDescriptorCopyAttribute((__bridge CTFontDescriptorRef)m, kCTFontURLAttribute));
        if (!url || [done containsObject:url.path]) continue;
        [done addObject:url.path];
        fontMan->RegisterFont(lString8(url.fileSystemRepresentation));
    }
}
/// Installed families named by `font-family` in a user CSS file.
static void registerFamilies(NSString *css) {
    static NSRegularExpression *re = [NSRegularExpression regularExpressionWithPattern:@"font-family\\s*:\\s*([^;}!]+)" options:NSRegularExpressionCaseInsensitive error:nil];
    for (NSTextCheckingResult *r in [re matchesInString:css options:0 range:NSMakeRange(0, css.length)])
        for (NSString *f in [[css substringWithRange:[r rangeAtIndex:1]] componentsSeparatedByString:@","])
            registerFamily([f stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" \t\n\"'"]]);
}

static NSArray<NSString *> *const generics = @[@"Times New Roman", @"Helvetica", @"Apple Chancery", @"Papyrus", @"Menlo"]; // css_ff_serif … css_ff_monospace
static NSString *const fallback = @"Apple Symbols"; // CoreText's fallback for symbols such as ⦾ (CoReader gets the whole system cascade)
static lString8 baseCSS;

static void initEngine() {
    InitFontManager(lString8::empty_str);
    for (NSString *f in [generics arrayByAddingObject:fallback]) registerFamily(f);
    registerFamilies(readText(globalCSS()));
    // Required even with hyphenation off: propsApply looks the selected dictionary up.
    HyphMan::initDictionaries(U([NSBundle.mainBundle.resourcePath stringByAppendingString:@"/hyph/"]));
    NSString *cache = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"CrReader"];
    [NSFileManager.defaultManager createDirectoryAtPath:cache withIntermediateDirectories:YES attributes:nil error:nil];
    ldomDocCache::init(U(cache), 0x100000 * 256);
    // UA sheet: crengine's epub.css, KOReader's default in-page footnote tweaks (80 % notes, like CoReader),
    // and text colour from the theme only (CoReader does not apply CSS `color`).
    lString8 epub;
    LVLoadStylesheetFile(U([NSBundle.mainBundle pathForResource:@"epub" ofType:@"css"]), epub); // resolves @import "html5.css"
    NSString *ua = [NSString stringWithUTF8String:epub.c_str()];
    ua = [ua stringByAppendingString:@"\n*[type~=\"note\"], *[type~=\"endnote\"], *[type~=\"footnote\"], *[type~=\"rearnote\"],"
          " *[role~=\"doc-note\"], *[role~=\"doc-endnote\"], *[role~=\"doc-footnote\"], *[role~=\"doc-rearnote\"]"
          " { -cr-only-if: -fb2-document; -cr-hint: footnote-inpage; margin: 0 !important; }\n"
          "*, autoBoxing { -cr-hint: late; -cr-only-if: -fb2-document inpage-footnote; font-size: 0.8urem !important; }\n"
          "* { color: inherit !important; }\n"];
    baseCSS = lString8(ua.UTF8String);
}

// MARK: document

static const CGFloat margin = 40;
static const NSSize windowSize = {620, 860};

@interface CRDocument : NSDocument
@property(readonly) LVDocView *view;
@property(readonly) NSString *identifier;
@property(readonly) BOOL ignoreBookCSS;
- (void)applyStyle:(CGFloat)scale;
@end

@interface CRView : NSView
- (instancetype)initWithDocument:(CRDocument *)doc;
@end

@implementation CRDocument {
    LVDocView *_view;
    CGFloat _scale;
}
- (LVDocView *)view { return _view; }
+ (BOOL)autosavesInPlace { return NO; }
- (NSString *)ignoreKey { return [@"ignoreBookCSS." stringByAppendingString:self.identifier]; }
- (BOOL)ignoreBookCSS { return _identifier && [NSUserDefaults.standardUserDefaults boolForKey:self.ignoreKey]; }

/// Props that change the layout. Set before LoadDocument so crengine's cache (keyed on them) is reused.
- (void)applyStyle:(CGFloat)scale {
    _scale = scale;
    NSString *css = readText(globalCSS());
    if (_identifier) css = [css stringByAppendingFormat:@"\n%@", readText(bookCSS(_identifier))];
    registerFamilies(css);
    _view->setStyleSheet(baseCSS + "\n" + lString8(css.UTF8String));
    CRPropRef p = LVCreatePropsContainer();
    p->setString(PROP_FONT_FACE, "Times New Roman");
    p->setString(PROP_FONT_FAMILY_FACES, lString8(([@"|" stringByAppendingString:[generics componentsJoinedByString:@"|"]]).UTF8String));
    p->setString(PROP_FALLBACK_FONT_FACES, lString8(fallback.UTF8String));
    p->setInt(PROP_FONT_SIZE, 16);
    p->setInt(PROP_RENDER_DPI, int(96 * scale));
    p->setInt(PROP_RENDER_SCALE_FONT_WITH_DPI, 1);
    p->setInt(PROP_RENDER_BLOCK_RENDERING_FLAGS, 0x7FFFFFFF); // KOReader "web" mode, its default for new books
    p->setInt(PROP_FONT_KERNING, 3);                          // HarfBuzz shaping
    p->setInt(PROP_FONT_HINTING, 0);
    p->setInt(PROP_INTERLINE_SPACE, 100);
    p->setInt(PROP_FOOTNOTES, 1);
    // EPUB footnotes are non-linear (html5.css): put them on their own pages, which page turns skip
    // (KOReader's "hide non-linear fragments"), so notes show only at the page bottom, as in CoReader.
    p->setInt(PROP_NONLINEAR_PAGEBREAK, 1);
    p->setInt(PROP_EMBEDDED_STYLES, !self.ignoreBookCSS);
    p->setInt(PROP_EMBEDDED_FONTS, 1);
    p->setString(PROP_HYPHENATION_DICT, PROP_HYPHENATION_DICT_VALUE_NONE); // CoReader has no hyphenation
    p->setInt(PROP_TEXTLANG_HYPHENATION_ENABLED, 0);
    for (const char *k : {PROP_PAGE_MARGIN_TOP, PROP_PAGE_MARGIN_BOTTOM, PROP_PAGE_MARGIN_LEFT, PROP_PAGE_MARGIN_RIGHT})
        p->setInt(k, int(margin * scale));
    _view->propsApply(p);
}

- (BOOL)readFromURL:(NSURL *)url ofType:(NSString *)type error:(NSError **)error {
    _view = new LVDocView(32, true);
    _view->setViewMode(DVM_PAGES, 1);
    _view->setPageHeaderInfo(0);
    CGFloat scale = NSScreen.mainScreen.backingScaleFactor;
    _view->Resize(int(windowSize.width * scale), int(windowSize.height * scale));
    [self applyStyle:scale];
    bool ok = timed(@"LoadDocument (ZIP, OPF, parse every XHTML into the DOM, or read cache)",
                    [&] { return _view->LoadDocument(url.fileSystemRepresentation); });
    if (!ok) {
        if (error) *error = [NSError errorWithDomain:NSCocoaErrorDomain code:NSFileReadCorruptFileError userInfo:@{
            NSLocalizedDescriptionKey: [NSString stringWithFormat:@"“%@” could not be opened.", url.lastPathComponent],
            NSLocalizedFailureReasonErrorKey: @"crengine could not load this file."}];
        return NO;
    }
    NSString *ids = NS(_view->getDocProps()->getStringDef(DOC_PROP_IDENTIFIERS));
    _identifier = [ids componentsSeparatedByString:@"\n"].firstObject ?: @"";
    // The per-book CSS and its toggle are known only now; restyle (no layout has happened yet).
    if (readText(bookCSS(_identifier)).length || self.ignoreBookCSS) [self applyStyle:scale];
    return YES;
}

- (NSString *)displayName {
    NSString *t = _view ? NS(_view->getTitle()) : nil;
    return t.length ? t : super.displayName;
}

- (void)makeWindowControllers {
    NSWindow *window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0, 0, windowSize.width, windowSize.height)
        styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable
        backing:NSBackingStoreBuffered defer:NO];
    window.minSize = NSMakeSize(300, 300);
    CRView *v = [[CRView alloc] initWithDocument:self];
    mark(@"window created");
    window.contentView = v;
    [window makeFirstResponder:v];
    [window center];
    NSWindowController *wc = [[NSWindowController alloc] initWithWindow:window];
    wc.shouldCascadeWindows = YES;
    [self addWindowController:wc];
}

- (void)close {
    if (_view) { _view->close(); delete _view; _view = nullptr; } // close() writes crengine's cache file
    [super close];
}

- (IBAction)editBookCSS:(id)sender { editFile(bookCSS(self.identifier)); }
- (IBAction)toggleIgnoreBookCSS:(id)sender {
    [NSUserDefaults.standardUserDefaults setBool:!self.ignoreBookCSS forKey:self.ignoreKey];
    [NSNotificationCenter.defaultCenter postNotificationName:userCSSChanged object:nil];
}
- (BOOL)validateMenuItem:(NSMenuItem *)item {
    if (item.action == @selector(toggleIgnoreBookCSS:)) { item.state = self.ignoreBookCSS ? NSControlStateValueOn : NSControlStateValueOff; return YES; }
    return [super validateMenuItem:item];
}
@end

// MARK: view

@implementation CRView {
    __weak CRDocument *_doc;
    uint32_t *_pixels;
    int _pw, _ph;
    BOOL _dirty, _drawn, _turned;
    CGFloat _scrollAccum;
}

- (instancetype)initWithDocument:(CRDocument *)doc {
    self = [super initWithFrame:NSMakeRect(0, 0, windowSize.width, windowSize.height)];
    _doc = doc;
    _dirty = YES;
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(cssChanged) name:userCSSChanged object:nil];
    return self;
}
- (void)dealloc { free(_pixels); }
- (BOOL)acceptsFirstResponder { return YES; }
- (LVDocView *)cr { return _doc.view; }
- (CGFloat)scale { return self.window.backingScaleFactor ?: NSScreen.mainScreen.backingScaleFactor; }

// MARK: layout

/// Re-lays out at the current size and scale; crengine keeps the position (its bookmark xpointer).
- (void)relayout {
    if (!self.cr) return;
    [_doc applyStyle:self.scale];
    self.cr->Resize(int(self.bounds.size.width * self.scale), int(self.bounds.size.height * self.scale));
    [self redraw];
}
- (void)redraw { _dirty = YES; self.needsDisplay = YES; }
- (void)cssChanged { [self relayout]; }
- (void)viewDidEndLiveResize { [super viewDidEndLiveResize]; [self relayout]; }
- (void)setFrameSize:(NSSize)size {
    BOOL changed = !NSEqualSizes(size, self.frame.size);
    [super setFrameSize:size];
    if (changed && !self.inLiveResize && self.window) [self relayout];
}
- (void)viewDidChangeBackingProperties { [self relayout]; }
- (void)viewDidChangeEffectiveAppearance { [self redraw]; }

// MARK: navigation

/// Next/previous page of the main flow; at either end of the book it stays put.
- (void)turn:(int)step {
    LVRendPageList *pages = self.cr->getPageList();
    int p = self.cr->getCurPage();
    do p += step; while (p >= 0 && p < pages->length() && (*pages)[p]->flow != 0);
    if (p < 0 || p >= pages->length()) return;
    self.cr->goToPage(p);
    [self redraw];
}
- (IBAction)nextPage:(id)sender { [self turn:1]; }
- (IBAction)previousPage:(id)sender { [self turn:-1]; }
- (IBAction)goBack:(id)sender { if (self.cr->goBack()) [self redraw]; else NSBeep(); }

- (void)keyDown:(NSEvent *)e {
    switch (e.keyCode) {
        case 124: [self nextPage:nil]; break;
        case 123: [self previousPage:nil]; break;
        case 49: (e.modifierFlags & NSEventModifierFlagShift) ? [self previousPage:nil] : [self nextPage:nil]; break;
        default: [super keyDown:e];
    }
}

- (void)mouseUp:(NSEvent *)e {
    NSPoint p = [self convertPoint:e.locationInWindow fromView:nil];
    CGFloat s = self.scale;
    ldomXPointer xp = self.cr->getNodeByPoint(lvPoint(int(p.x * s), int((self.bounds.size.height - p.y) * s)), true);
    NSString *href = xp.isNull() ? @"" : NS(xp.getHRef());
    if (href.length) return [self follow:href];
    p.x < NSMidX(self.bounds) ? [self previousPage:nil] : [self nextPage:nil];
}

- (void)follow:(NSString *)href {
    if ([href hasPrefix:@"http:"] || [href hasPrefix:@"https:"]) {
        NSURL *url = [NSURL URLWithString:href];
        if (!url) return;
        NSAlert *alert = [NSAlert new];
        alert.messageText = @"Open this link in your browser?";
        alert.informativeText = href;
        [alert addButtonWithTitle:@"Open"];
        [alert addButtonWithTitle:@"Cancel"];
        [alert beginSheetModalForWindow:self.window completionHandler:^(NSModalResponse r) {
            if (r == NSAlertFirstButtonReturn) [NSWorkspace.sharedWorkspace openURL:url];
        }];
        return;
    }
    if (self.cr->goLink(U(href), true)) [self redraw]; else NSBeep();
}

- (void)swipeWithEvent:(NSEvent *)e {
    if (e.deltaX < 0) [self nextPage:nil]; else if (e.deltaX > 0) [self previousPage:nil];
}
/// One page turn per two-finger horizontal gesture; momentum ignored.
- (void)scrollWheel:(NSEvent *)e {
    if (e.momentumPhase != NSEventPhaseNone) return;
    if (e.phase == NSEventPhaseBegan) { _scrollAccum = 0; _turned = NO; }
    if (!(e.phase == NSEventPhaseChanged || e.phase == NSEventPhaseBegan) || _turned) return;
    _scrollAccum += e.scrollingDeltaX;
    if (fabs(_scrollAccum) > 40) { _turned = YES; _scrollAccum < 0 ? [self nextPage:nil] : [self previousPage:nil]; }
}

// MARK: drawing

/// "chapter title · page x/y in the chapter · book %", chapters from the TOC.
- (NSString *)footer {
    LVDocView *cr = self.cr;
    int page = cr->getCurPage(), count = cr->getPageCount();
    std::vector<LVTocItem *> flat;
    std::function<void(LVTocItem *)> walk = [&](LVTocItem *t) {
        for (int i = 0; i < t->getChildCount(); i++) { flat.push_back(t->getChild(i)); walk(t->getChild(i)); }
    };
    walk(cr->getToc());
    NSString *title = NS(cr->getTitle());
    int start = 0, end = count;
    for (size_t i = 0; i < flat.size(); i++) {
        if (flat[i]->getPage() > page) break;
        start = flat[i]->getPage(); title = NS(flat[i]->getName()); end = count;
        for (size_t j = i + 1; j < flat.size(); j++) if (flat[j]->getPage() > start) { end = flat[j]->getPage(); break; }
    }
    LVRendPageList *pages = cr->getPageList();
    int x = 0, y = 0; // main-flow pages only
    for (int i = start; i < end && i < pages->length(); i++) if ((*pages)[i]->flow == 0) { y++; if (i <= page) x++; }
    return [NSString stringWithFormat:@"%@ · %d/%d · %d%%", title, MAX(x, 1), MAX(y, 1), cr->getPosPercent() / 100];
}

static lUInt32 rgb(NSColor *c) {
    NSColor *s = [c colorUsingColorSpace:NSColorSpace.sRGBColorSpace];
    return (lUInt32(s.redComponent * 255 + 0.5) << 16) | (lUInt32(s.greenComponent * 255 + 0.5) << 8) | lUInt32(s.blueComponent * 255 + 0.5);
}

/// crengine draws the page into a 32-bit buffer at backing pixel size.
- (void)renderPage {
    LVDocView *cr = self.cr;
    cr->setBackgroundColor(rgb(NSColor.textBackgroundColor));
    cr->setTextColor(rgb(NSColor.textColor));
    timed(@"render (lay out the whole book, or reuse the cache)", [&] { cr->checkRender(); return 0; });
    // Trace only: COREADER_TRACE_SPINE=N opens at spine item N, as in CoReader.
    if (const char *n = traceOn && !_drawn ? getenv("COREADER_TRACE_SPINE") : nullptr)
        cr->goToBookmark(cr->getDocument()->createXPointer(U([NSString stringWithFormat:@"/body/DocFragment[%d]", atoi(n) + 1])));
    int w = cr->GetWidth(), h = cr->GetHeight();
    if (w != _pw || h != _ph) { free(_pixels); _pixels = (uint32_t *)calloc(size_t(w) * h, 4); _pw = w; _ph = h; }
    LVColorDrawBuf buf(w, h, (lUInt8 *)_pixels, 32);
    timed(@"Draw page into buffer", [&] { cr->Draw(buf, false); return 0; });
    _dirty = NO;
}

- (void)drawRect:(NSRect)dirtyRect {
    timed(_drawn ? @"draw" : @"first draw", [&] {
        [self.effectiveAppearance performAsCurrentDrawingAppearance:^{
            [NSColor.textBackgroundColor setFill];
            NSRectFill(self.bounds);
            if (!self.cr) return;
            if (self->_dirty) [self renderPage];
            CGContextRef ctx = NSGraphicsContext.currentContext.CGContext;
            CGColorSpaceRef cs = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
            CGDataProviderRef dp = CGDataProviderCreateWithData(nullptr, self->_pixels, size_t(self->_pw) * self->_ph * 4, nullptr);
            CGImageRef img = CGImageCreate(self->_pw, self->_ph, 8, 32, size_t(self->_pw) * 4, cs,
                                           kCGImageAlphaNoneSkipFirst | kCGBitmapByteOrder32Little, dp, nullptr, false, kCGRenderingIntentDefault);
            // During a live resize the old page stays at the top left until the resize ends (as in CoReader).
            CGFloat s = self.scale;
            CGContextDrawImage(ctx, CGRectMake(0, self.bounds.size.height - self->_ph / s, self->_pw / s, self->_ph / s), img);
            CGImageRelease(img); CGDataProviderRelease(dp); CGColorSpaceRelease(cs);
            NSAttributedString *f = [[NSAttributedString alloc] initWithString:self.footer attributes:@{
                NSFontAttributeName: [NSFont systemFontOfSize:NSFont.smallSystemFontSize],
                NSForegroundColorAttributeName: NSColor.secondaryLabelColor}];
            CTLineRef line = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)f);
            CGContextSetTextPosition(ctx, NSMidX(self.bounds) - CTLineGetTypographicBounds(line, nullptr, nullptr, nullptr) / 2, margin / 2 - 4);
            CTLineDraw(line, ctx);
            CFRelease(line);
        }];
        return 0;
    });
    if (!_drawn) { _drawn = YES; dispatch_async(dispatch_get_main_queue(), ^{ mark(@"next runloop turn after first draw"); }); }
}
@end

// MARK: app

@interface AppDelegate : NSObject <NSApplicationDelegate>
@end
@implementation AppDelegate {
    NSArray<NSDate *> *_stamp;
}
- (NSArray<NSDate *> *)cssStamp {
    NSMutableArray *files = [NSMutableArray arrayWithObject:globalCSS()];
    [files addObjectsFromArray:[NSFileManager.defaultManager contentsOfDirectoryAtURL:booksDir() includingPropertiesForKeys:nil options:0 error:nil] ?: @[]];
    [files sortUsingComparator:^(NSURL *a, NSURL *b) { return [a.path compare:b.path]; }];
    NSMutableArray *dates = [NSMutableArray array];
    for (NSURL *u in files) [dates addObject:[NSFileManager.defaultManager attributesOfItemAtPath:u.path error:nil].fileModificationDate ?: NSDate.distantPast];
    return dates;
}
- (void)applicationWillFinishLaunching:(NSNotification *)n {
    mark(@"applicationWillFinishLaunching");
    timed(@"initEngine (fonts, cache dir, UA CSS)", [] { initEngine(); return 0; });
}
- (void)applicationDidFinishLaunching:(NSNotification *)n {
    mark(@"applicationDidFinishLaunching");
    [NSFileManager.defaultManager createDirectoryAtURL:booksDir() withIntermediateDirectories:YES attributes:nil error:nil];
    // ponytail: 1 s poll of the CSS files' mtimes, as in CoReader.
    _stamp = self.cssStamp;
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer *) {
        NSArray *s = self.cssStamp;
        if (![s isEqual:self->_stamp]) { self->_stamp = s; [NSNotificationCenter.defaultCenter postNotificationName:userCSSChanged object:nil]; }
    }];
}
- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender { return NO; }
- (IBAction)editUserCSS:(id)sender { editFile(globalCSS()); }
@end

static NSMenu *buildMenu() {
    NSMenu *main = [NSMenu new];
    auto sub = [&](NSString *title, NSArray<NSMenuItem *> *items) {
        NSMenu *m = [[NSMenu alloc] initWithTitle:title];
        for (NSMenuItem *i in items) [m addItem:i];
        NSMenuItem *host = [[NSMenuItem alloc] initWithTitle:title action:nil keyEquivalent:@""];
        host.submenu = m;
        [main addItem:host];
        return m;
    };
    auto item = [](NSString *t, SEL a, NSString *k = @"") { return [[NSMenuItem alloc] initWithTitle:t action:a keyEquivalent:k]; };
    sub(@"CrReader", @[item(@"Edit User CSS…", @selector(editUserCSS:)), NSMenuItem.separatorItem,
                       item(@"Hide CrReader", @selector(hide:), @"h"), item(@"Quit CrReader", @selector(terminate:), @"q")]);
    NSMenu *recent = [[NSMenu alloc] initWithTitle:@"Open Recent"];
    [recent addItem:item(@"Clear Menu", @selector(clearRecentDocuments:))];
    NSMenuItem *recentItem = item(@"Open Recent", nil);
    recentItem.submenu = recent;
    sub(@"File", @[item(@"Open…", @selector(openDocument:), @"o"), recentItem, NSMenuItem.separatorItem, item(@"Close", @selector(performClose:), @"w")]);
    sub(@"Edit", @[item(@"Copy", @selector(copy:), @"c")]);
    sub(@"Book", @[item(@"Edit Book CSS…", @selector(editBookCSS:)), item(@"Ignore Book CSS", @selector(toggleIgnoreBookCSS:))]);
    sub(@"Go", @[item(@"Back", @selector(goBack:), @"[")]);
    NSApp.windowsMenu = sub(@"Window", @[item(@"Minimize", @selector(performMiniaturize:), @"m")]);
    return main;
}

int main() {
    @autoreleasepool {
        mark([NSString stringWithFormat:@"main (process started at wall %.3f)", processStart()]);
        NSApplication *app = timed(@"NSApplication.shared", [] { return NSApplication.sharedApplication; });
        AppDelegate *delegate = [AppDelegate new];
        app.delegate = delegate;
        app.mainMenu = timed(@"buildMenu", [] { return buildMenu(); });
        [app setActivationPolicy:NSApplicationActivationPolicyRegular];
        [app run];
    }
}
