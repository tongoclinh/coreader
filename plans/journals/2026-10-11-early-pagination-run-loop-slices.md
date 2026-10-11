# Early-stop pagination: run-loop slices instead of a background thread

**Date**: 2026-10-11
**Severity**: Medium (performance)
**Component**: `App/Reader.swift` (`ReaderView`), `Sources/CoReaderEngine/Layout.swift`

## What happened

Opening the 4 MB worst-case chapter spent 592 ms of ~816 ms engine time in `Paginator.paginate()`, which laid out all 1947 pages before the first draw. `ReaderView` now keeps a page chain (`pages`, `tail`, `extend(to:)`) over `layoutPage(from:)`: it lays out pages up to the target page plus 3, then `paginateRest()` finishes the chapter in ≤ 8 ms main-run-loop slices, rescheduled after each draw.

## Decision

The brainstorm contract chose a background thread with its own `Chapter`, because `TextBlock.typesetter`, `Note.starts` and `Chapter.decoded` are not thread-safe. During cook the owner said edge cases (jumping 100 pages right after open, holding an arrow key) only need correct rendering. That made run-loop slices the cheaper choice: same output, no second Chapter (no extra parse/cascade CPU or RAM), no generation token. A turn waits at most one slice.

## Evidence

- Chain starts equal `paginate()` starts on 53/53 spine items (bien-than 42, nguoi-moi-den 10, worst-case). This was a throwaway check; a permanent test would only compare the same `layoutPage` loop with itself.
- Worst case: trace paginate 592 → 1.5 ms. `bench-open` first 1244 → 674–731 ms, reopen 1229 → 640–659 ms. bien-than within noise.
- 30 page turns at 50 ms intervals during the slices were all drawn on cadence (draw ≤ 6.7 ms).

## Remaining

- The gap to the floor (~200–250 ms) is XHTML parse plus Chapter build. Next step: build the Chapter lazily per block and parse in a streaming way.
- Two slow paths stay synchronous until D7: turning back into a huge chapter (626 ms) and deep anchors in an unpaginated huge chapter.
