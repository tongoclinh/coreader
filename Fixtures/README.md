# Fixtures

`private/` holds copyrighted books from the owner's library
(`/Volumes/azEx/ebooks/calibre/gr_normalized`, Keigo Higashino, Vietnamese
translations). It is git-ignored. Restore it by copying the files listed below.

None of these books conforms to the [CoReader EPUB Profile](../docs/coreader-epub-profile.md)
as-is. v1 uses them to test degraded rendering, and they are the input set
for the future optimizer.

Selection: 93 Keigo Higashino EPUBs were scanned (92 are EPUB 3.0 and 1 is
EPUB 2.0). These six cover every drop-cap and footnote pattern found.

| File | Title | SHA-256 (16) | Drop cap | Footnotes | Other |
|---|---|---|---|---|---|
| k01.epub | Thanh gươm do dự | ee5fd43322f2cfed | **Standard**: `h1 + p::first-letter { initial-letter: 2 }` inside `@supports` | Pandoc `aside[epub:type=footnote]`, same file. The noteref wraps a long phrase, not a marker. The backlink text is "1." | — |
| k02.epub | Người mới đến | 1f79e298beeff0e1 | **Standard** `initial-letter: 2` (same template) | 20 `aside` notes, backlink "←" | Embedded font `iCielBCOldStyle` |
| k03.epub | Silent Parade | 7977d10b45373b7c | **Legacy**: `h1 + p::first-letter { float:left; font-size:3.2em; margin:-0.25em …; font-family:"Tropical Punch" }`, with an `@media amzn-kf8` override | 20 `aside` notes, `a.footnote-ref` with "1" | Embedded drop-cap font |
| k04.epub | Biến Thân | 5f5aa5a655b4f2ae | **Legacy**: `header + p::first-letter`, with font-family `!important` | `aside` notes placed **between paragraphs mid-chapter**; noteref "⦾" inside `<i>` | Four embedded fonts |
| k05.epub | Đơn phương | a394aa86f49e5e5c | — | `section[epub:type=footnotes] > hr + ol > li[epub:type=footnote]`, backlink `role=doc-backlink` "↩︎", noteref "*" | — |
| k06.epub | Sau giờ học | 3e2b9eff3ab3e72d | — | **Cross-file**: `sup > a.footnote-ref` with no noteref semantics, pointing to `aside[epub:type=footnote]` in `index_split_020.html` | Calibre split (`index_split_NNN.html`) |

## Profile-conforming samples (`private/profile/`)

Hand-converted from k02 and k04 into the
[CoReader EPUB Profile](../docs/coreader-epub-profile.md). Both pass
`scripts/check-profile.py`. They are the full-fidelity acceptance books for v1.

| File | From | SHA-256 (16) | Covers |
|---|---|---|---|
| nguoi-moi-den.profile.epub | k02 | 526f23ed2cc9550a | `h1 + p::first-letter { initial-letter: 2 }`; 20 notes (phrase-wrapping refs rewritten as text + numeric `MARK`); notes grouped at chapter end; `@font-face` TTF headings; `hr.break` |
| bien-than.profile.epub | k04 | 4b1e1830251e95ec | `header + p::first-letter { initial-letter: 3 }` with embedded OTF; 11 notes placed mid-chapter between paragraphs; `⦾` marker inside `<i>`; `div.note` diary chapters; three embedded fonts |

The conversion was a hand-tuned one-off and is not kept. Each conversion
replaced the SVG title page with an `<img>` cover, merged the stylesheets into
one profile-only `book.css`, and dropped the NCX, the guide, backlinks,
`style` elements and non-profile attributes.

`worst-case.profile.epub` is generated, not hand-converted: `scripts/make-worst-case.py [MB]`
rebuilds it from bien-than (default 4 MB) and it passes `scripts/check-profile.py`. It is the
open-speed worst case: the first spine item is one 4 MB document (bien-than repeated, 302 notes,
114 block images, a drop cap per chapter copy). Bench it with `BOOKS=worst-case scripts/bench-open.sh`.

## Committed synthetic fixtures

| Path | Used by | Purpose |
|---|---|---|
| `spike/*.xhtml`, `spike/plain.css` | `scripts/spike.sh` | Drop-cap and footnote cases; `plain.css` is their book CSS |
| `spike/reader.css` | every script | Reader settings as user CSS (Times New Roman 18 px, justified) |
| `spike/frame.css` | webref only | WebKit page geometry (600 px page, 40 px margins) |
| `css/torture.*` | `scripts/p2.sh` | Selectors, specificity, units, keywords, invalid CSS: computed styles must match WebKit |
| `css/origins*` | `scripts/p2.sh` | User CSS merged after book CSS (specificity, order, `!important`) and `--no-book-css`, checked against fixed expectations |
| `css/user-inject.css` | `scripts/p2.sh` | A simple user stylesheet to test injection (no preset ships in v1) |
| `layout/blocks.*`, `layout/*.png` | `scripts/p3.sh` | Block and inline images, lists, `svg` skip, `break-before: page`: page count and line positions are checked |
