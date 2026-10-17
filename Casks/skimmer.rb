cask "skimmer" do
  version "0.1.105"

  on_macos do
    url "https://github.com/dorkitude/skimmer/releases/download/v0.1.105/skimmer_0.1.105_darwin_all.tar.gz"
    sha256 "4f76b0ef0bf9cbf7cb91e225dabec51dc8fc13f48ddd8ded9bb81fcb2c7e2f4a"
  end

  on_linux do
    on_arm do
      url "https://github.com/dorkitude/skimmer/releases/download/v0.1.105/skimmer_0.1.105_linux_arm64.tar.gz"
      sha256 "9a75cd7f27869e49d10ca3b5d656e444d2ec339b40014ef6a9f5b4527cda3ad1"
    end
    on_intel do
      url "https://github.com/dorkitude/skimmer/releases/download/v0.1.105/skimmer_0.1.105_linux_amd64.tar.gz"
      sha256 "bea58a28365de4e8e45a6cda0e41d91a4e4a199c940a8238b69b74bbb7c31f0f"
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
