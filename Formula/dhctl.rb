class Dhctl < Formula
  desc "CLI for the DreamHost API: DNS records, announcement lists, API metacommands"
  homepage "https://github.com/dorkitude/dhctl"
  url "https://github.com/dorkitude/dhctl/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "e5a389c6acb3736af4d6ddbabe88e1f490501f1b9f463fc66da315f4e86492e8"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/dorkitude/dhctl/cmd.Version=#{version}"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dhctl --version")
    assert_match "DreamHost", shell_output("#{bin}/dhctl --help")
  end
end
