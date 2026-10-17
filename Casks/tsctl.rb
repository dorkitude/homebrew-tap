cask "tsctl" do
  version "0.1.2"

  on_macos do
    url "https://github.com/dorkitude/tsctl/releases/download/v0.1.2/tsctl_0.1.2_darwin_all.tar.gz"
    sha256 "bc8a0c15f25b5f12968790400c1f1e9a7d378b5f0a95a836a1156e07065e1755"
  end

  on_linux do
    on_arm do
      url "https://github.com/dorkitude/tsctl/releases/download/v0.1.2/tsctl_0.1.2_linux_arm64.tar.gz"
      sha256 "352585eb5f2bc70ef1a3e7b2e05127d69cab9916bffc90e56e211d66b8f7cd01"
    end
    on_intel do
      url "https://github.com/dorkitude/tsctl/releases/download/v0.1.2/tsctl_0.1.2_linux_amd64.tar.gz"
      sha256 "b85020ef5ca6b57b1d57246f309dc84c867de3fe11855a1e91555edf4360a497"
    end
  end

  name "tsctl"
  desc "Administer a Tailscale tailnet: devices, tags, policy file, auth keys, any API endpoint"
  homepage "https://github.com/dorkitude/tsctl"

  livecheck do
    skip "Updated by scripts/publish-packages.sh on release."
  end

  binary "tsctl"

  # The binary is not notarized: without this, macOS quarantines it and
  # refuses to run it. No-op on Linux.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "{{staged_path}}/tsctl"], must_succeed: false
  end
end
