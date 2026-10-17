cask "deadlore" do
  version "0.7.1"

  on_macos do
    url "https://github.com/dorkitude/deadlore/releases/download/v0.7.1/deadlore_0.7.1_darwin_all.tar.gz"
    sha256 "0dafe9f0bf94b96e884e030dc4f923a48a4765ed9f8d9e9af01c64d715562c8a"
  end

  on_linux do
    on_arm do
      url "https://github.com/dorkitude/deadlore/releases/download/v0.7.1/deadlore_0.7.1_linux_arm64.tar.gz"
      sha256 "90ba14128ea460598e73c486a0d953b6b70c9c36c4a310491a38be2f0d20a2f1"
    end
    on_intel do
      url "https://github.com/dorkitude/deadlore/releases/download/v0.7.1/deadlore_0.7.1_linux_amd64.tar.gz"
      sha256 "1aaf77c44a16f1ee12026882d7c637f2a8a3f5be9ae71080069173a18c371889"
    end
  end

  name "deadlore"
  desc "Source-aware CLI for the community-maintained Deadlock Wiki"
  homepage "https://github.com/dorkitude/deadlore"

  livecheck do
    skip "Updated by scripts/publish-packages.sh on release."
  end

  binary "deadlore"

  # The binary is not notarized: without this, macOS quarantines it and
  # refuses to run it. No-op on Linux.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "{{staged_path}}/deadlore"], must_succeed: false
  end
end
