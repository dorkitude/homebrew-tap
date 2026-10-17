cask "skimmer" do
  version "0.1.106"

  on_macos do
    url "https://github.com/dorkitude/skimmer/releases/download/v0.1.106/skimmer_0.1.106_darwin_all.tar.gz"
    sha256 "893081fe9a4f6745b53f72d1daea1494f8ad36689ba1a3de2ea7876f91b0f39a"
  end

  on_linux do
    on_arm do
      url "https://github.com/dorkitude/skimmer/releases/download/v0.1.106/skimmer_0.1.106_linux_arm64.tar.gz"
      sha256 "67d5b957162544a22c4a4138deda35f64876e1d61a2fbbc71c5b328e62d9f37c"
    end
    on_intel do
      url "https://github.com/dorkitude/skimmer/releases/download/v0.1.106/skimmer_0.1.106_linux_amd64.tar.gz"
      sha256 "f49a0a21c1be12f8fa38eda415dfbe3cb335f57b5d6c8f9e7183e5e3798c5b91"
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
