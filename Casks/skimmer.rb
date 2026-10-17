cask "skimmer" do
  version "0.1.104"

  on_macos do
    url "https://github.com/dorkitude/skimmer/releases/download/v0.1.104/skimmer_0.1.104_darwin_all.tar.gz"
    sha256 "97b0b446999076cd5e40e272ee6425a20c89c1e1dc1fa7a929d076c4ceee3197"
  end

  on_linux do
    on_arm do
      url "https://github.com/dorkitude/skimmer/releases/download/v0.1.104/skimmer_0.1.104_linux_arm64.tar.gz"
      sha256 "7db53847656e24931fbf24134502a92c2af090361bae7d739d62406ae487d460"
    end
    on_intel do
      url "https://github.com/dorkitude/skimmer/releases/download/v0.1.104/skimmer_0.1.104_linux_amd64.tar.gz"
      sha256 "5487636765733d652f42d8f48ddbab12787cbf06a6b8e42149ac3d808009e2d4"
    end
  end

  name "skimmer"
  desc "Skim pages, files, and lists with Jev: keep only what helps with your goal. Saves agent tokens."
  homepage "https://github.com/dorkitude/skimmer"

  livecheck do
    skip "Updated by scripts/publish-packages.sh on release."
  end

  binary "skimmer"

  # The binary is not notarized: without this, macOS quarantines it and
  # refuses to run it. No-op on Linux.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "{{staged_path}}/skimmer"], must_succeed: false
  end
end
