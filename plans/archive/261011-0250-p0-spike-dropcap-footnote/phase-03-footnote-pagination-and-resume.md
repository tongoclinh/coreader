---
phase: 3
title: "Footnote pagination and resumable page starts"
status: done
priority: P1
effort: "3d"
dependencies: [1, 2]
---

# Phase 3: Footnote pagination and resumable page starts

## Goal

Paginate one chapter into fixed pages under the footnote and drop-cap rules of profile §8:

- a note sits at the bottom of the page whose line holds its first ref;
- a ref line is pushed to the next page when its note cannot get 2 lines;
- long notes are split across pages;
- a drop cap moves to the next page when its height does not fit.

Prove that every page can be rebuilt in a fresh process from a saved `PageStart`. Widows, orphans and heading rules are deferred to P3 (S10).

## Files to Create / Modify

- Create `Sources/CoReaderEngine/Notes.swift`.
  - At parse time it collects the `aside[epub:type=footnote]` elements by id and removes them from the flow.
  - It records each note's **first ref position** (block, offset) in document order. That fact is static, so no cross-page state is needed to answer "which ref came first".
  - Note content is `MARK` (the first ref's text) + U+0020 + its blocks. Multiple `p` elements are joined with a paragraph separator into one concatenated note string, and note offsets index into that string.
  - Note style: 0.8 × the body size, with the same line-height ratio.
- Create `Sources/CoReaderEngine/Paginator.swift`:
  - `struct PageStart: Codable, Equatable { block: Int; offset: Int; pendingNotes: [NoteCursor] }`, where `offset` is UTF-16 relative to the block and includes the first letter;
  - `struct NoteCursor: Codable, Equatable { note: Int; offset: Int }`;
  - `func layoutPage(from: PageStart) -> (Page, next: PageStart?)`, which depends only on `(chapter, style, geometry, PageStart)`;
  - `func paginate() -> [PageStart]`.
- Modify `Sources/CoReaderEngine/Paragraph.swift`: support starting at an offset > 0 inside a paragraph. That start has no indent and no cap, and its typesetter range still begins at the block offset.
- Modify `Sources/coreader/main.swift`. New subcommands:
  - `paginate <xhtml> --style … --fonts … --out-dir <dir> [--check]`, which writes `page-NNN.png` and `pages.json` (the `PageStart` array);
  - `verify-resume <xhtml> --pages <pages.json> …`, run as a separate process.
- Create three synthetic fixtures under `Fixtures/spike/`, all original text:
  - `footnote-push.xhtml`: the ref sits on a line L where the space left below L is less than `noteLH (separator) + 2·noteLH`, so the line must move.
  - `footnote-split.xhtml`: a 25-line note referenced mid-page, followed on the next page by another ref with a short note.
  - `footnote-edge.xhtml`, one file with these cases:
    - two refs on one line (one long note, one short);
    - a second ref to an existing note;
    - a ref in the last line of a paragraph;
    - a ref inside `h1`;
    - a note whose text contains a ref to another note (nested; it renders as text and does not place a note);
    - a note with 2 `p`;
    - a new note on a page that already carries a split note.
- Modify `scripts/spike.sh`: add a `footnotes` part.

## Algorithm: two passes per page

**Separator cost**: one note line-height, charged only when the page has at least one note line.

**Pass 1, choosing the body.**
1. Start the note area with the carried `pendingNotes`, capped at `pageHeight − 1·bodyLH` so the body always gets at least one line.
2. Place body lines one at a time. For each line, look at the notes whose first ref falls inside that line's range. Each such note needs `min(2, its lines)` reserved lines, plus the separator if the page has no note lines yet.
3. If the line plus those reservations does not fit, the line and everything after it go to the next page.
   - **Progress exception**: if this would be the first body line of the page, place it anyway. Its notes then receive whatever space remains and split.
4. **Drop-cap paragraph**. The paragraph's start must fit in height `max(sink·LH, capBaseline − ink.minY)` measured from the paragraph's top, plus the note reservations of its lines. This is a height test; it never counts the paragraph's own lines. If the start does not fit, move the whole paragraph to the next page, unless it is the first block on the page.
5. A drop-cap exclusion that is still active when the page ends is dropped. The next page starts at full width.

**Pass 2, filling notes.**
1. First the carried `pendingNotes`, in order.
2. Then the new notes, in first-ref order, each filling as many lines as fit.
3. A note that does not fit entirely goes into `next.pendingNotes` as `NoteCursor(note, offset)`. Every note after it on this page goes there too, with offset 0.

**Next page**: `PageStart(block, offset, pendingNotes)`.

## Tasks & Steps

1. Implement `Notes` and the note line layout, reusing `Paragraph` with the note style.
2. Implement `layoutPage` and `paginate` as specified above.
3. Drawing:
   - body lines;
   - a separator 1/3 of the column wide and 0.5 pt thick, centred in its note line-height slot;
   - note lines;
   - a footer showing `n / total` in a small font.
4. `paginate --check` assertions:
   - no body line overlaps the note area;
   - every note's text appears exactly once across all pages, in first-ref order, with its count read from the XHTML;
   - every page except the last holds at least one body line or one note line;
   - in `footnote-push`, page 1 ends before the line that holds the ref.
5. **Independent continuity check** inside `paginate --check`:
   - concatenate the body lines (block, range) of all pages;
   - compare them with the phase-1 tall-column layout using the same widths;
   - lines narrowed by a drop cap are compared only on the cap's own page.
6. **`verify-resume`** runs in a separate process:
   - decode `pages.json`;
   - for each `PageStart` k, build a new `Chapter` and `FontBook`, then lay out one page;
   - compare against `page-k` from `paginate`, using a `lines.json` dump that `paginate` writes next to the PNGs. String ranges must match exactly, and x/baseline must match within 0.001;
   - print PASS or the first mismatch.

## Verification

- `scripts/spike.sh footnotes` exits 0. It runs `paginate --check` and `verify-resume` on each of the following:
  - `plain.xhtml`;
  - `footnote-push.xhtml`;
  - `footnote-split.xhtml`;
  - `footnote-edge.xhtml`;
  - the short-paragraph drop-cap case placed at a page bottom.
- Visual check:
  - push: the ref line and its note sit together on page 2, and page 1 ends early.
  - split: the note continues at the top of page 2's note area, before the new short note.
  - edge: two notes from one line, the repeated ref places no second note, and the nested ref shows as plain text.
