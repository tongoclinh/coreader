---
phase: 4
title: "Real chapters, timing, report, gate G1"
status: done
priority: P1
effort: "1d"
dependencies: [2, 3]
---

# Phase 4: Real chapters, timing, report, gate G1

## Goal

Run the engine on real profile chapters and measure cold reopen speed. Assemble one `artifacts/spike/` package for the owner's verdict at G1.

## Files to Create / Modify

- Modify `scripts/spike.sh`: add the `books`, `bench` and `all` (default) parts.
  - **Order**: `swift build -c release`, then `dropcaps` and `footnotes` (synthetic parts first), then `books`, then `bench`.
  - **Preflight**: `books` and `bench` stop immediately with `Fixtures/private/profile missing — see Fixtures/README.md` when the fixtures are absent.
  - **Wiping**: each part wipes only its own `artifacts/spike/<part>/` and `build/spike-input/<part>/` (extracted with `unzip`; this is a stopgap until the P1 ZIP reader).
- Modify `Sources/coreader/main.swift`: `bench <xhtml> --style … --fonts … [--cold]` prints JSON.
  - `--cold`: a single run in this process. It parses, styles, loads the fonts, runs `layoutPage(from:)` on the middle `PageStart` from `pages.json`, and renders the bitmap without PNG encoding. It prints `reopenMs`.
  - Without `--cold`: `pageMeanMs`, the mean over all pages after one warm-up.
  - `spike.sh bench` runs `--cold` in 5 fresh processes and reports the median, plus one warm run.
- Create `artifacts/spike/report.md` by hand from the JSON outputs. It is gitignored.

## Real chapters

| Book | Chapter | Purpose | PNGs |
|---|---|---|---|
| bien-than.profile | `c04.xhtml` (4 notes, 53 KB; the drop-cap paragraph is 1 line, "Tôi đang ở trong nước.") | Tarif N = 3 cap after `header`, short-paragraph carry-over, notes mid-chapter | All pages |
| bien-than.profile | `c26.xhtml` (the largest, 98 KB, 2 notes) | Worst-case timing | None (bench only) |
| nguoi-moi-den.profile | `c03.xhtml` (6 notes) | N = 2 cap with `“S`, the densest notes | All pages |

Each chapter runs through `paginate --check` and `verify-resume`.

## Tasks & Steps

1. Run `scripts/spike.sh` end to end and fix the issues found in the real markup (`<i><a noteref>`, `h1 > span`, `hr.break`, notes mid-chapter vs at the end).
2. Benchmark. Record the numbers for reference only. There is no baseline yet, so no targets and no pass/fail.
3. Write `report.md` with these sections:
   - **Verdict needed**: what to look at first, linked to the PNGs.
   - **Drop-cap deltas**: a table built from `dropcap.json`.
   - **Footnotes**: links to pages. State explicitly that **footnote pages have no WebKit reference** and are judged by eye plus `--check`.
   - **Timing**: a table with `reopenMs` (cold) and `pageMeanMs`.
   - **Known glitches**: diacritic overflow (S1), any cap-height anomaly, and any delta beyond tolerance.
   - **Open questions for G1**:
     - Trailing punctuation in `::first-letter`.
     - A cap-height fallback for fonts with OS/2 older than v2.
     - The greedy note filling: a long note can end the page's body early.
     - Whether S4 (the WebKit box) should be recorded in the profile §8 contract.
4. Stop. Present the `artifacts/spike/` path and the report summary to the owner. P1 does not start.

## Verification

- `scripts/spike.sh` exits 0 with `Fixtures/private/` present. Without it, the synthetic parts still pass and `books` prints the preflight message.
- Every link in `report.md` resolves (checked by glob).
- `git status --porcelain` shows nothing under `artifacts/` or `build/`, and no PNG.
- **G1: the owner's verdict.** Record it in `docs/project-brief.md#change-log`, along with any spec changes it implies.
