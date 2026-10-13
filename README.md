# homebrew-tap

Official [Homebrew](https://brew.sh) tap for
[PlateVault](https://github.com/platevault/platevault), a local-first desktop
app for organizing astrophotography libraries.

## Install

```bash
brew install --cask platevault/tap/platevault
```

Use the fully qualified `platevault/tap/platevault` name: Homebrew 6 requires
it to trust a third-party tap.

Apple Silicon Macs only — no Intel build is published yet. The macOS build is
ad-hoc signed but not notarized, so Gatekeeper blocks the app on first launch.
Since macOS Sequoia, Control-click › Open no longer bypasses this: open the app
once, then go to System Settings › Privacy & Security and click **Open Anyway**
(also documented in the cask's `caveats`).

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
