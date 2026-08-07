class Quadratic < Formula
  desc "Local-first Foursquare and Swarm check-in backup CLI"
  homepage "https://github.com/dorkitude/quadratic"
  url "https://github.com/dorkitude/quadratic/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "86132a94bb86661a1338fb3936ddd3ba78336b309b279249fa1fa0359418176f"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X quadratic/cmd.version=v#{version}")
  end

  test do
    assert_match "quadratic version #{version}", shell_output("#{bin}/quadratic --version")
  end
end
