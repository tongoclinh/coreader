# Agent rules

Read [README.md](README.md) and [docs/project-brief.md](docs/project-brief.md) first.

## Code

- The engine package uses only Foundation, CoreText, CoreGraphics, ImageIO and the system libxml2. Never import AppKit there.
- The app uses AppKit. No SwiftUI on the reading path.
- Protect the first-paint critical path: do no work before the first page is drawn except what that page needs.
- Add third-party packages only with a measured need.

## Data and tests

- Never commit `Fixtures/private/`; it holds copyrighted books.
- Prefer E2E tests. Keep their artifacts (screenshots, logs, renders) in `artifacts/`.

## Process

- Stop at gates G1 and G2 for the owner's review.
- Specs are living. To diverge from a spec, propose the change in the [change log](docs/project-brief.md#change-log) instead of silently diverging.
- The owner writes in Vietnamese. Reply in Vietnamese and keep technical terms in English.
