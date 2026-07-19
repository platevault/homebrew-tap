# homebrew-tap

Official [Homebrew](https://brew.sh) tap for
[PlateVault](https://github.com/platevault/platevault), a local-first desktop
app for organizing astrophotography libraries.

## Install

```bash
brew tap platevault/tap
brew install --cask platevault
```

Apple Silicon Macs only — no Intel build is published yet. The macOS build is
ad-hoc signed but not notarized, so Gatekeeper will refuse to open the app on
first launch; `brew install --cask` prints the workaround (also documented in
the cask's `caveats`).

## Updating the cask

`Casks/platevault.rb` is bumped automatically by a workflow in the
[platevault/platevault](https://github.com/platevault/platevault) repo when a
release is published (`.github/workflows/homebrew-bump.yml` there). Manual
edits are fine for out-of-band fixes but will be overwritten by the next
automated bump if they touch `version`/`sha256`.

## CI

`.github/workflows/install-test.yml` runs `brew style`, `brew audit --cask`,
and a real `brew install --cask` / `brew uninstall --cask --zap` round trip on
`macos-latest` whenever `Casks/**` changes.
