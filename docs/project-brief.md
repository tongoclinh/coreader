# CoReader — Project Brief (bootstrap contract)

Status: **Baseline (2026-10-11).** Changes are expected as the spike and
implementation show what works. Record each change in the doc's change log.

Source request: "rewrite lại phần epub reader của koreader thành 1 native macos application".
That request evolved through discussion into the contract below.

## Outcome

CoReader is a native macOS EPUB reader for novels. The number-one goal is to
**open a book as fast as possible**: double-click an `.epub` and land on the
right page immediately.

It renders with its own layout engine (Swift on CoreText). The engine
reproduces what KOReader does that plain CSS readers cannot: real drop caps
(`initial-letter`) and in-page footnotes at the bottom of the page.

Input is restricted to the [CoReader EPUB Profile](coreader-epub-profile.md),
a strict and versioned subset of EPUB 3. A future optimizer tool (out of
current scope) will convert arbitrary EPUBs into the profile.

## Decisions

| # | Decision | Why |
|---|---|---|
| D1 | Own engine on CoreText. No crengine, no WebKit rendering. | Speed (lay out one page, not the whole book), native text, no GPL/C++ stack |
| D2 | Input is CoreReader EPUB Profile 1.0 only. EPUB 2, fixed layout and DRM are refused. Other non-conforming content is ignored. | The engine stays small. Heuristics belong to the future optimizer. |
| D3 | User CSS override: a global file plus an optional per-book file. Cascade order is UA < user < book < book `!important` < user `!important`. Per-book switch to ignore book CSS. The default user CSS ports KOReader `epub.css`. | The reader controls the look |
| D4 | CSS in three layers behind one `Stylesheet` model: a spec-conformant CSS Syntax 3 tokenizer/parser, a Selectors-4 AST with bucketed matching, and a property registry. Unknown CSS is preserved and never fails parsing. The profile is versioned. lexbor (Apache-2.0) is the fallback. | CSS support will grow over time |
| D5 | Drop caps follow CSS Inline 3 `initial-letter`: they align on the font's cap-height metric, as the undiacritised letter would. Glitches from Vietnamese diacritics (clipping, overlap, horn collisions) are accepted in v1 and only listed. | Owner decision |
| D6 | Footnotes are `a[epub:type=noteref]` and `aside[epub:type=footnote]` in the same document, placed at the bottom of the page that holds the ref. A ref line moves to the next page when its note cannot get 2 lines. Long notes split across pages. | Profile §5 and §8 |
| D7 | Positions use EPUB CFI 1.1. A per-page resumable pagination cache means reopening a book lays out one page. | Fastest reopen |
| D8 | 100% Swift. The engine package uses Foundation, CoreText, CoreGraphics, ImageIO and the system libxml2, with no AppKit. The app uses AppKit. XcodeGen generates the project. macOS 14+. Third-party packages only with a measured need. | |
| D9 | The ZIP is read in place (central directory plus on-demand inflate). No extraction and no re-zipping. | Measured: inflating 1.1 MB of text takes 1.1 ms; parsing a 98 KB chapter takes 0.53 ms |

## Non-goals (v1)

The optimizer tool, EPUB 2, fixed layout, TOC sidebar, search, highlights,
bookmarks, settings UI, popups, SVG, tables, vertical or RTL page progression,
font deobfuscation, distribution and signing.

## Phases and gates

P0 is a spike: drop caps and footnotes in CoreText. It ends with **G1**, the
owner's verdict on the rendered images. P1 through P5 follow: container,
CSS, layout, app shell, then positions and speed. They end with **G2**, an
end-to-end read of a whole book. Work between the two gates runs continuously,
protected by tests.

Details: [`engine-scope.md`](engine-scope.md); plans in `plans/`.

## Definition of done (v1)

1. G1 is approved. `artifacts/spike/` holds CoreText renders next to WebKit references, plus `report.md` with geometry deltas, layout timing and known glitches.
2. Both `Fixtures/private/profile/*.epub` books read end to end in the app. Drop caps and footnotes are correct, and every chapter matches its approved golden PNG.
3. The six original fixtures open in degraded form: 0 crashes, 0 blank pages.
4. The E2E test passes: open, page, resize, quit, then reopen at the same CFI. Screenshots and the log are kept.
5. Speed and memory are measured and recorded: `bench-open` reopen and first open, cold launch to first page, and footprint with one book open. The earlier targets (≤ 100 / 200 / 500 ms, ≤ 150 MB) are only reference points until P0 and P5 produce a baseline.

The project is verified locally only; there is no release target.

## License

To be decided by the owner. The project no longer derives from KOReader or
crengine code.

## Change log

- 2026-10-11: Baseline set after the brainstorm and advise sessions.
- 2026-10-11: Drop-cap horizontal box follows WebKit. Text starts after the cap's advance width plus `margin-right`, and the side bearing is kept. This replaces the css-inline-3 ink-plus-kerning model (owner decision during the P0 plan red team).
- 2026-10-11: There is no speed baseline yet, so timings are recorded for reference only, not gated. Hyphenation is dropped from v1: `hyphens` is parsed and ignored, and profile §8 has been updated.
- 2026-10-11: **G1 passed** (owner verdict on the P0 spike). Continue to P1 on the CoreText engine. Accepted: the bien-than c04 Tarif cap delta (~2.2% larger than WebKit), and greedy note filling (a long note can end the page body early; edge case). Profile §6 now states the first letter includes trailing punctuation, and that cap fonts without an OS/2 v2+ cap height are unsupported in v1 (fallback deferred). §8 Drop caps now states the cap box (advance + `margin-right`) explicitly.
- 2026-10-11: P1 container done (`scripts/p1.sh`). ZIP64 is not supported (novels are far below 4 GB); entry CRCs are not checked. `page-progression-direction` is ignored (RTL progression is not in v1). Fonts are still mapped per book by the spike style table until CSS (P2).
- 2026-10-11: P2 planning (owner): no reading preset ships in v1 and KOReader `epub.css` is not ported; user CSS is pure injection (a simple test file exercises it). User CSS may name installed system fonts; font resolution is book `@font-face` → user `@font-face` → system family → generics. Unknown CSS is kept in the parsed stylesheet for diagnostics only. See engine-scope "Styling".
- 2026-10-11: P2 CSS done (`scripts/p2.sh`): `SpikeStyle` replaced by the real cascade with no change to any P0 output (pages, lines and drop-cap geometry byte-identical). Computed styles match WebKit on a torture fixture and on every spine document of both profile books. UA sheet divergences from WebKit: no `body` margin (page margins come from the viewport) and no list `padding-left` (lists are P3). Type selectors are case-sensitive (XHTML). `text-indent` in `em` computes to px where declared and inherits as px.
- 2026-10-11: Owner: user CSS takes precedence over book CSS, web style. User CSS is merged after the book CSS into one author origin, and the normal rules decide (`!important`, specificity, order). This replaces the five-origin order (user normal below book normal). User `@font-face` now comes before book `@font-face`. engine-scope "Styling" updated.
- 2026-10-11: P3 layout done (`scripts/p3.sh`; every spine document of both profile books and k01–k06 passes `paginate --check`). An image is a one-character block whose only line is the image box, scaled to fit the column; inline images ride a `CTRunDelegate` and do not grow the line box. Lists get UA `padding-left: 40px` and markers inside the content (`• `, `N. `). `break-before: page` starts a page; widows/orphans 2 and "heading never last" are a cut-back pass, so P0 page breaks moved (expected). `aside[epub:type=footnote]` that nothing references stays in the flow (profile §9 degraded). k06's content images point at missing ZIP entries and are skipped.
- 2026-10-11: P4 app shell done (`scripts/build-app.sh` → `build/CoReader.app`, screenshots in `artifacts/p4/`). Draws straight into the view (no page bitmaps); text and background colours follow the system theme, so CSS `color` is not applied. Book percent uses uncompressed spine entry sizes. User CSS lives in `~/Library/Application Support/CoReader/` (`user.css`, `books/<id>.css`) and reloads by a 1 s mtime poll. Resize and CSS edits keep the position by (block, offset) until P5 brings CFI and saved positions. Deferred: swipe direction unverified on hardware; a page turn during a live resize shows the old layout until the resize ends.
- 2026-10-11: Preliminary open benchmark (`scripts/bench-open.sh`, external screen capture to "visually complete 99%", `artifacts/bench/summary.md`). bien-than, app launched cold each run: CoReader ~0.42 s, calibre viewer ~2.1–2.2 s, Apple Books 6.0 s first import / 4.0 s reopen, KOReader ~5.4 s (its own log reports the book open in < 0.1 s; the window appears late on this Mac). 1–8 runs per cell; reference only, apps open different first pages and window sizes.
- 2026-10-11: D1 revisited after the benchmark: crengine lays out a whole book faster (bien-than ~70 ms vs ~157 ms), but open time is dominated by app launch, so CoReaderEngine stays. Added CrReader (`scripts/build-crreader.sh` → `build/CrReader.app`, `CrReader/main.mm`): a rough AppKit reader on pinned `koreader/crengine` (GPL-2, separate app, personal/open-source use), only for comparison (`plans/archive/261011-1330-crreader/`). `bench-open.sh` now compares CoReader, CrReader and KOReader only (Apple Books and calibre dropped). bien-than, visually complete: CoReader 435 / 419 ms, CrReader 535 / 429 ms (first / reopen; 2 runs for CrReader). `COREADER_TRACE=1` (and `COREADER_TRACE_SPINE=N`) prints a per-stage open trace in both apps.
- 2026-10-11: Owner decision: keep developing CoReaderEngine (not patching crengine). Reasons: native CoreText text, own layout rules (D5/D6), a reading-style layer outside CSS; crengine opens a whole book at once (all spine items into one DOM, whole-book render), which would need core rewrites. Worst-case fixture `worst-case.profile.epub` (`scripts/make-worst-case.py`, one 4 MB spine document): CoReader 1244 ms first / 1229 ms reopen (paginate 592 ms of 816 ms engine time), CrReader 2086 / 412 ms. Next targets: worst-case open and reopen within the empty-app floor + 30 ms, page turn p99 ≤ 16 ms.
- 2026-10-11: Speed baseline is now the worst case: `worst-case.profile.epub` (one 4 MB chapter) costs ~816 ms of engine time on a cold start (paginate 592 ms) and 1244 ms visually complete; the floor (empty AppKit app) is 460–483 ms. Plan `plans/archive/261011-1414-early-pagination/` (early-stop pagination + background completion) is measured against it; reassess after it lands.
- 2026-10-11: Early-stop pagination landed (`plans/archive/261011-1414-early-pagination/`): a chapter opens with only up to the target page + 3 laid out; the rest is paginated on the main run loop in ≤ 8 ms slices (no background thread, no second Chapter); anchors deep in an unpaginated chapter paginate synchronously up to the anchor. Footer shows `x/…` until counted; book % now uses the in-chapter block share. Worst case: 1244 → ~700 ms first open, 1229 → ~650 ms reopen; remaining gap to the floor is XHTML parse + Chapter build (~215 ms).
- 2026-10-11: `bench-open.sh` default apps are CoReader and CrReader (CrReader replaces KOReader as the crengine reference); KOReader stays available via `APPS="… koreader"`. Completed plans moved to `plans/archive/`.
