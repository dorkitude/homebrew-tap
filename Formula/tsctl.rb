class Tsctl < Formula
  desc "Administer a Tailscale tailnet: devices, tags, policy file, auth keys, any API endpoint"
  homepage "https://github.com/dorkitude/tsctl"
  url "https://github.com/dorkitude/tsctl/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "258834fae3c92e90591afc061e8ab14a73a799709df70434e186c550c4c1fd5c"
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
