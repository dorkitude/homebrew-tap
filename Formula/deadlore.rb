class Deadlore < Formula
  desc "Source-aware CLI for the community-maintained Deadlock Wiki"
  homepage "https://github.com/dorkitude/deadlore"
  url "https://github.com/dorkitude/deadlore/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "840ca8eb4e68dd50deb1e42904666c58e1860bfeebc4d756ca2e3ef834e2464f"
  license "CC-BY-NC-SA-4.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/deadlore"
  end

  test do
    assert_match "canonical Deadlock Wiki article", shell_output("#{bin}/deadlore --help")
    assert_match "Lists compact metadata for public in-game builds", shell_output("#{bin}/deadlore build --help")
  end
end
