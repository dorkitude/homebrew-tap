class Deadlore < Formula
  desc "Source-aware CLI for the community-maintained Deadlock Wiki"
  homepage "https://github.com/dorkitude/deadlore"
  url "https://github.com/dorkitude/deadlore/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "46958a4ca6b5d874013d72c825c1b85766620e7abc05f843f29981dcaf59cff6"
  license "CC-BY-NC-SA-4.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/deadlore"
  end

  test do
    assert_match "canonical Deadlock Wiki article", shell_output("#{bin}/deadlore --help")
  end
end
