---
phase: 3
title: "Parity, origins, regressions"
status: pending
---

# Phase 3: Parity, origins, regressions

## Files
- `coreader styles <xhtml|--epub …>` and `webref --styles`: per-element computed style JSON
- `Fixtures/css/`: selector/specificity/inheritance/units torture fixture; origins fixture with expected values
- `scripts/p2.sh` → `artifacts/p2/`

## Tasks
- [x] Style parity vs WebKit: torture fixture + every spine document of both profile books, zero unexplained mismatches
- [x] Origins: user normal < book normal < book `!important` < user `!important`; `--no-book-css`; inheritance trap (C3) shown
- [x] P0 regressions: `scripts/spike.sh all` passes; book `pages.json`/`lines.json` unchanged or each difference explained
- [x] k01–k06: every spine document styles without error; unknown at-rules/properties counted in the report
- [x] Reference timing: parse + cascade cost inside cold reopen

## Verification
- `scripts/p2.sh` exits 0; `artifacts/p2/summary.txt` lists parity results, origin cases, ignored-CSS counts and timing.
