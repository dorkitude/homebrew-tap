cask "dhctl" do
  version "0.3.101"

  on_macos do
    url "https://github.com/dorkitude/dhctl/releases/download/v0.3.101/dhctl_0.3.101_darwin_all.tar.gz"
    sha256 "29659e21bacf40c1db77ea5ffb3118ea45bf907e2c446b44f4e0675dca7893b8"
  end

  on_linux do
    on_arm do
      url "https://github.com/dorkitude/dhctl/releases/download/v0.3.101/dhctl_0.3.101_linux_arm64.tar.gz"
      sha256 "7e1f1371a03bbd29efd5e357342e9c0ed8ac112b816232bbbe3c38979e2ceedb"
    end
    on_intel do
      url "https://github.com/dorkitude/dhctl/releases/download/v0.3.101/dhctl_0.3.101_linux_amd64.tar.gz"
      sha256 "2d60f3776c353d68deff7657beef0cc20b107ce2558ce406b1d541908f77a29e"
    end
  end

  name "dhctl"
  desc "CLI for the DreamHost API: DNS records, announcement lists, API metacommands"
  homepage "https://github.com/dorkitude/dhctl"

  livecheck do
    skip "Updated by scripts/publish-packages.sh on release."
  end

  binary "dhctl"

  # The binary is not notarized: without this, macOS quarantines it and
  # refuses to run it. No-op on Linux.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "{{staged_path}}/dhctl"], must_succeed: false
  end
end
