---
phase: 1
title: "App, reader view, verification"
status: done
---

# Phase 1: App, reader view, verification

## Files
- `project.yml`, `App/Info.plist`, `App/*.swift`
- `scripts/build-app.sh` → `build/CoReader.app`
- `artifacts/p4/`: screenshots of the real app

## Tasks
- [x] XcodeGen project, `.epub` document type, build script
- [x] Document + window: open, refuse with message, Open Recent
- [x] Reader view: page drawing (theme), footer (chapter title, page x/y, book %)
- [x] Page turns: ← → Space, click halves, trackpad swipe; chapter boundaries; empty chapters skipped
- [x] Resize keeps position
- [x] Links: internal with back stack (⌘[), external with confirmation
- [x] User CSS files, live reload, Ignore Book CSS toggle
- [x] Drive the real app: open both profile books, page through chapter boundaries, a footnote page, a drop-cap page, dark mode, resize, a refused book; screenshots kept

## Verification
- `scripts/build-app.sh` builds; the app session screenshots in `artifacts/p4/` show each behaviour above.
