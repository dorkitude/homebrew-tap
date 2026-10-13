class Tsctl < Formula
  desc "Administer a Tailscale tailnet: devices, tags, policy file, auth keys, any API endpoint"
  homepage "https://github.com/dorkitude/tsctl"
  url "https://github.com/dorkitude/tsctl/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "0f6f15e7d3d8a8b099190798c8b220eccc94c34ab0fa77f91aaefca22206a978"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "."
    generate_completions_from_executable(bin/"tsctl", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tsctl --version")
    assert_match "policy", shell_output("#{bin}/tsctl --help")
  end
end
