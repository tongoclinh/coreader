# CoReader

A native macOS EPUB reader for novels, with its own Swift layout engine on
CoreText. It renders books that follow the
[CoReader EPUB Profile](docs/coreader-epub-profile.md), a strict, versioned
subset of EPUB 3.

## Goals, in priority order

1. **Fastest possible opening**: double-click an `.epub` and land on the right page immediately.
2. **Faithful novel typography**: real drop caps (CSS `initial-letter`) and in-page footnotes at the bottom of the page, as KOReader does.
3. **User CSS override**: a global file plus an optional per-book file, so the reader controls the look.

## Non-goals (v1)

The optimizer tool that converts EPUBs into the profile, EPUB 2, fixed layout,
TOC sidebar, search, highlights, bookmarks, settings UI, popups, SVG, tables,
vertical or RTL page progression, font deobfuscation, distribution and signing.

## Status

Pre-P0: design docs only, no code yet.

## Roadmap

- **P0** spike: drop caps and footnotes in CoreText. Ends with gate **G1**, the owner's verdict on the rendered images.
- **P1** container, **P2** CSS, **P3** layout, **P4** app shell, **P5** positions and speed. Ends with gate **G2**, an end-to-end read of a whole book.

## Docs

- [Project brief](docs/project-brief.md): outcome, decisions, phases, definition of done.
- [v1 scope](docs/engine-scope.md): engine, styling, opening, app, validation.
- [CoReader EPUB Profile](docs/coreader-epub-profile.md): the input contract.
- [EPUB 3 survey](docs/refs/epub/epub3-survey.md) and [spec copies](docs/refs/epub/spec/README.md).
- [Fixtures](Fixtures/README.md): test books and how to restore them.
- [Agent rules](AGENTS.md).

Specs evolve during development; they are a baseline, not a hard lock. Changes
are recorded in the [change log](docs/project-brief.md#change-log).

## Fixtures

Copyrighted books stay in `Fixtures/private/`, which is git-ignored and never
committed.

## Toolchain

Xcode 27 / Swift 6.4, macOS 14+ target, project generated with XcodeGen.
