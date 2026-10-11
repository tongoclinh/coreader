---
title: "Early-stop pagination with run-loop completion"
description: "Open a chapter by laying out only the target page and the next 3; paginate the rest on the main run loop in ≤ 8 ms slices. First step towards worst-case open within the empty-app floor + 30 ms."
status: completed
priority: P1
effort: 1d
branch: main
tags: [performance, engine]
blockedBy: []
blocks: []
created: 2026-10-11
---

# Early-stop pagination

## Baseline (2026-10-11, before this plan)

Worst case: `Fixtures/private/profile/worst-case.profile.epub` (`scripts/make-worst-case.py`): one 4.07 MB spine document, 302 notes, 114 images, first in the spine.

| Measure | Value |
|---|---|
| `bench-open` visually complete, first / reopen | 1244 / 1229 ms (RUNS=1) |
| Engine time before first draw (trace, cold start) | ~816 ms: inflate 6, XHTML parse 86, CSS 0.3, Chapter 129, **paginate 592** |
| Floor (empty AppKit app, same `open` path) | 460–483 ms |
| bien-than (reference) | 435 / 419 ms; paginate of opened chapter ~10 ms |

## Contract

Implementation changed during cook (owner: "don't invest in edge cases, just render the right page"): no background thread, no second `Chapter`. The rest of the chapter is paginated **on the main run loop in ≤ 8 ms slices** after each draw. Same output, no shared-state hazards, no extra RAM/CPU; a page turn waits at most one slice.

- Outcome: opening a chapter lays out only up to the target page plus 3 (`ReaderView.ahead`); page turns extend that chain on demand; `paginateRest()` completes the chapter in slices so the footer gets its count.
- Mid-chapter anchor (resize, CSS edit, `#fragment`, ⌘[) and far jumps: paginate synchronously from the chapter start up to the page holding the anchor (owner decision: page boundaries always canonical). Turning back into the previous chapter paginates it fully, as before.
- Footer: `x/…` until the chapter is counted, then `x/y`. Book % uses the in-chapter block share instead of `pageIndex / pages.count`.
- Cancellation: none needed; slices always extend the current chain and `show()` resets it.
- Constraints: engine package stays AppKit-free; first-paint path protected; page breaks identical to full pagination.
- Non-goals: D7 page cache, anchor-started pages, lazy Chapter build / streaming parse (86 + 129 ms stay on the open path), whole-book layout, saved positions (P5), pre-paginating the previous chapter.

## Phases

| # | Phase | Status |
|---|---|---|
| 1 | Engine: `PageStart.chapterStart`; the chain lives in `ReaderView` (`pages`, `tail`, `extend(to:)`) over `Paginator.layoutPage(from:)`; `paginate()` stays as the reference | done |
| 2 | Equality check: chain starts vs `paginate()` starts on every spine item of bien-than, nguoi-moi-den, worst-case (throwaway check; a permanent test would compare the same `layoutPage` loop with itself) | done: 53/53 EQUAL |
| 3 | App: chain (target + 3), `paginateRest()` slices, sync-to-anchor, footer `x/…`, % by block | done |
| 4 | Verify: trace + `bench-open` worst-case and bien-than, page turns while slices run, resize/link/⌘[ in worst-case; reassess against baseline and update brief | done |

## Acceptance

1. Trace `paginate` on the worst-case open path ≤ 10 ms (baseline 592).
2. Chain starts equal `paginate()` starts on all three profile books, every spine item.
3. Page turn while the background runs: draw trace ≤ 16 ms, no wait.
4. `bench-open` worst-case first open ~650 ms (≈ −590 ms); bien-than unchanged within noise.
5. Footer `x/…` → `x/y` once counted; small books show `x/y` from the first visible frame or within one background batch.

## Results (2026-10-11)

| Measure | Baseline | After |
|---|---|---|
| Worst-case `paginate` on the open path (trace) | 592 ms | 1.5 ms |
| Worst-case engine time before first draw (trace) | ~816 ms | ~226 ms (parse 85 + Chapter 129) |
| Worst-case `bench-open` first (RUNS=2) | 1244 ms | 731 / 674 ms |
| Worst-case `bench-open` reopen | 1229 ms | 640 / 659 ms |
| bien-than `bench-open` first / reopen | 435 / 419 ms | 444–465 / 430–462 ms (noise) |
| Rest of worst-case chapter in slices | — | done ~640 ms after first draw (1947 pages) |
| Page turns while slices run (30 × Right, 50 ms apart) | — | every key drawn on cadence; draw ≤ 6.7 ms |
| Relayout (zoom) at 16 % of worst-case | ~600 ms | 39 ms sync to anchor |
| Back into worst-case from the next chapter (`last`) | ~600 ms | 626 ms (unchanged, sync full chapter) |

Reassessment: worst-case is now ~200–250 ms above the floor (460–483 ms); that gap is XHTML parse + Chapter build. Next: lazy Chapter build per block + streaming parse. Remaining slow paths (back into a huge chapter, anchors deep in a huge chapter) are bounded by full pagination of one chapter and left to D7.

## Next (after reassessment)

Lazy Chapter build per block + streaming parse (removes ~215 ms), then P5 positions with D7 cache.
