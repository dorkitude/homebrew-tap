class Deadlore < Formula
  desc "Source-aware CLI for the community-maintained Deadlock Wiki"
  homepage "https://github.com/dorkitude/deadlore"
  url "https://github.com/dorkitude/deadlore/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "62c1a325cd5105a24efd4b251f07ff28d88baf2b7aab4aefac46d34f95442e16"
  license "CC-BY-NC-SA-4.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/deadlore"
  end

  test do
    assert_match "canonical Deadlock Wiki article", shell_output("#{bin}/deadlore --help")
  end
end
