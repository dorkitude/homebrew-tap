class Dhctl < Formula
  desc "CLI for the DreamHost API: DNS records, announcement lists, API metacommands"
  homepage "https://github.com/dorkitude/dhctl"
  url "https://github.com/dorkitude/dhctl/archive/refs/tags/v0.3.100.tar.gz"
  sha256 "f1dd1ddeda2c8cf11ce84172b87272daa0564a48501506021b1c161cfe190695"
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
