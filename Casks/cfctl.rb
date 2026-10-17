cask "cfctl" do
  version "0.2.711"

  on_macos do
    url "https://github.com/dorkitude/cfctl/releases/download/v0.2.711/cfctl_0.2.711_darwin_all.tar.gz"
    sha256 "f43d2e845f5821005d3bc62b7aa067452a65b82cd41ba035cb30995870612356"
  end

  on_linux do
    on_arm do
      url "https://github.com/dorkitude/cfctl/releases/download/v0.2.711/cfctl_0.2.711_linux_arm64.tar.gz"
      sha256 "076abae6dda5fa7c265ebc99e6d0fc45eaa382f2fdd969db72f012145571c5f0"
    end
    on_intel do
      url "https://github.com/dorkitude/cfctl/releases/download/v0.2.711/cfctl_0.2.711_linux_amd64.tar.gz"
      sha256 "6b759c88392a133ac55f3ee9b60548858b08664e9529b88b06b98985c5f419e4"
    end
  end

  name "cfctl"
  desc "The whole Cloudflare platform from your terminal (Workers, R2, DNS, every API operation)"
  homepage "https://github.com/dorkitude/cfctl"

  livecheck do
    skip "Updated by scripts/publish-packages.sh on release."
  end

  binary "cfctl"

  # The binary is not notarized: without this, macOS quarantines it and
  # refuses to run it. No-op on Linux.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "{{staged_path}}/cfctl"], must_succeed: false
  end
end
