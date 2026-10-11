# CoReader v1 scope (see [project-brief.md](project-brief.md))

Status: **Baseline (2026-10-11).** Changes are expected as the spike and
implementation show what works. Record each change in the
[change log](project-brief.md#change-log).

CoReader v1 renders books that follow the
[CoReader EPUB Profile](coreader-epub-profile.md) with its own engine (Swift +
CoreText). Books outside the profile still open in a degraded form
(profile §9). The optimizer tool that converts books into the profile is
**not** part of v1.

## Engine

- **Input**: the profile only. Content outside it is ignored; there are no compatibility heuristics.
- **Layout**: one spine document at a time. Footnotes stay within their own document (profile §5.1), so pagination of a chapter needs only that chapter.
- **Text**: CoreText for shaping, bidi and line breaking (no hyphenation in v1). CoreGraphics for drawing.
- **Rendering contract**: profile §8.
- **Drop caps**: aligned on the font's cap-height metric, like the undiacritised base letter (CSS Inline 3). Diacritic glitches are accepted in v1 and listed only.
- **Speed path**: mmap the ZIP, read the OPF, take the CFI and its spine item, parse that one XHTML and its CSS, lay out from the target page's start, then draw. The nav, page counts and neighbouring chapters are processed only after the first paint.
- **Memory**: flat DOM and style storage (arrays of structs), images decoded at display size, no page-bitmap cache, fonts registered per document.

## Styling

Two origins, as on the web:

1. UA sheet (HTML defaults for the profile's elements)
2. Author: the book CSS, then the user CSS files merged after it, as one sheet in that order

Within the author origin the normal CSS rules decide: `!important`, then specificity, then order. So at equal specificity the user wins; a more specific or `!important` book rule still wins, and user `!important` beats book `!important` at equal specificity.

- **User CSS**: one global file, `~/Library/Application Support/CoReader/user.css`, plus an optional per-book file, `…/CoReader/books/<dc:identifier sanitised>.css` (merged after the global file). Both use the profile's CSS subset (§3); `font-family` may also name an installed system family, and `@font-face` URLs resolve against the user CSS file.
- No reading preset ships in v1: without user CSS a book renders as UA + book CSS. A look such as KOReader's `epub.css` is just another user CSS file; the engine never special-cases one. Inherited properties belong on `html`/`body` in user CSS only when the book should keep its own values: a user declaration on an element (`p { text-align: … }`) also beats values the element would inherit from the book.
- Font resolution: user `@font-face` → book `@font-face` → installed system family → generics (`serif` Times New Roman, `sans-serif` Helvetica, `monospace` Menlo). No synthetic bold or italic.
- A per-book switch ignores book CSS (Book ▸ Ignore Book CSS, stored in UserDefaults per book).
- v1 edits user CSS in an external editor (Book ▸ Edit User CSS / Edit Book CSS create the file and open it); the app polls the files' mtimes every second and re-paginates in place when one changes.
- **CSS architecture** (built to grow): a CSS Syntax 3 tokenizer and parser, a Selectors-4 AST with rule buckets, and a property registry. Adding a property means adding a registry entry plus its layout support. Unknown CSS stays in the parsed stylesheet for diagnostics but never reaches the cascade (profile §9). lexbor is the fallback if selectors or values outgrow the in-house parser.

## Opening and positions

| Item | Choice |
|---|---|
| ZIP | Read in place: the central directory once, entries on demand; inflate with Apple's Compression framework. No extraction. Measured cost of inflating all text of a 24.8 MB novel: 1.1 ms. |
| Pagination cache | Page starts per document, keyed by book SHA-256 + layout key (viewport, user CSS hash). Stored in `~/Library/Caches/CoReader/`. |
| Position | EPUB CFI 1.1 subset: spine step, element steps and character offset; no ranges and no assertions on output, assertions tolerated on input. Saved per book. |
| First page | Only the document holding the saved position is laid out before the first paint. Other documents are counted in the background. |

## App

- Double-clicking an `.epub` opens it; one window per book; Open Recent.
- Page turns: ← → Space, click left or right half, trackpad swipe.
- Window resize re-paginates and keeps the CFI position.
- Retina rendering; light and dark theme following the system. Text and background colours come from the theme; images are not inverted.
- Footer: chapter title (from the nav), page x/y in the chapter, and percent of the book.
- Internal links navigate with a back stack (⌘[). External links open in the browser after confirmation.
- Refused books (profile §9) get a clear message.

## Not in v1

The optimizer tool, TOC sidebar, settings UI, search, highlights, bookmarks,
dictionary, font deobfuscation, SVG, tables, vertical writing, RTL page
progression, popups.

## Validation

- **Synthetic fixture** (committed, own content): `Fixtures/profile-sample.epub`, fully conforming, built from a source folder by a fixture script. It covers:
  - `initial-letter` 2 and 3
  - several notes on one page
  - a note long enough to split
  - a noteref near the page bottom
  - a block image
  - a page break
  - a nested TOC
  - embedded OTF fonts
  - user CSS overrides
- **Real books** (`Fixtures/private/`, the owner's library, not committed):
  - `profile/nguoi-moi-den.profile.epub` and `profile/bien-than.profile.epub` were converted by hand to the profile (they pass `scripts/check-profile.py`). They are the full-fidelity acceptance books: drop caps with N = 2 and N = 3, and notes both at the chapter end and mid-chapter.
  - The six originals must open and be readable in degraded form, with no crash and no blank pages. None of them conforms as-is.
- **E2E**: drive the real app (open, turn pages, resize, quit, reopen at the same CFI). Screenshots and the log are kept as artifacts.
