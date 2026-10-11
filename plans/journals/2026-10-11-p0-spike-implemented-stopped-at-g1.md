---
title: P0 spike implemented — stopped at G1
date: 2026-10-11
---

# P0 spike implemented — stopped at G1

## What happened
Implemented P0 phases 1–4 (`/ak:cook --auto`). `scripts/spike.sh all` runs build → dropcaps → footnotes → books → bench and exits 0. Package for the owner: `artifacts/spike/report.md`.

## Results
- Drop caps vs WebKit: 11/12 within S5 tolerance. bien-than c04 (Tarif T) out: capBottom +1.99 px, lineStart 2.21 px — our cap is uniformly ~2.2% larger; TNR caps agree ≤1 px, so the cap-height derivation for Tarif differs between engines. Cause not pinned.
- Footnotes: push/split/edge/drop-cap-at-bottom fixtures + c04 (28 pp) + c03 (25 pp) pass `paginate --check` and `verify-resume`. verify-resume was mutation-tested (offset change, dropped pending note → fail).
- Timing (reference only): cold reopen median 14.7 / 19.2 / 13.9 ms (c04 / c26 / c03); warm ~1.15 ms per page.

## Bugs found on the way
- Pass 2 note filling let a carried long note eat the min-2 lines reserved for later notes, so new notes started a page after their ref. Fix: subtract the later notes' reservations from capacity.
- `::first-letter` must include trailing punctuation ("Ừ,") to match WebKit.
- `paste -sd,` over files with no trailing newline produced invalid `dropcap.json`; joined via `awk 1`.

## Waiting on
G1 owner verdict; record it in docs/project-brief.md change log. P1 not started.

> Historical work record — not durable authority. Prefer docs/specs/ADRs for current decisions.
