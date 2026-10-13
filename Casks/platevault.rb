cask "platevault" do
  arch arm: "aarch64"

  version "0.5.0"
  sha256 "0deb5dc85c5da9b1c7db62c0f3ad53e7a125dd63c863eb5ab792da40a15c5c37"

  url "https://github.com/platevault/platevault/releases/download/v#{version}/PlateVault_#{version}_#{arch}.dmg"
  name "PlateVault"
  desc "Local-first desktop app for organizing astrophotography libraries"
  homepage "https://github.com/platevault/platevault"

  # The app has its own in-app updater (tauri-plugin-updater, minisign-signed
  # against latest.json) — this cask's version is only what a *fresh*
  # `brew install` fetches; `brew upgrade` will not fight the in-app updater.
  auto_updates true
  # Apple Silicon only supports Big Sur+, and the release workflow's macOS
  # leg builds a single arm64 target with no cross-compile target — no Intel
  # build is published today.
  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "PlateVault.app"

  zap trash: [
    "~/Library/Application Support/dev.astro-plan.astro-library-manager",
    "~/Library/Caches/dev.astro-plan.astro-library-manager",
    "~/Library/HTTPStorages/dev.astro-plan.astro-library-manager",
    "~/Library/Preferences/dev.astro-plan.astro-library-manager.plist",
    "~/Library/Saved Application State/dev.astro-plan.astro-library-manager.savedState",
    "~/Library/WebKit/dev.astro-plan.astro-library-manager",
  ]

  caveats <<~EOS
    PlateVault's macOS build is ad-hoc signed but not Apple-notarized (no
    paid Apple Developer account yet; see the upstream repo's
    docs/development/code-signing.md). On first launch, Gatekeeper blocks
    the app. Since macOS Sequoia, Control-click -> Open no longer bypasses
    this. Instead, try to open the app once, then go to
    System Settings -> Privacy & Security and click "Open Anyway".

    Install with the fully qualified name so Homebrew trusts this tap:

      brew install --cask platevault/tap/platevault

    Only Apple Silicon Macs are supported; no Intel build is published yet.
  EOS
end
