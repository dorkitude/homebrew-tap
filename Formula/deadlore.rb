class Deadlore < Formula
  desc "Source-aware CLI for the community-maintained Deadlock Wiki"
  homepage "https://github.com/dorkitude/deadlore"
  url "https://github.com/dorkitude/deadlore/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "6336d3842f8a17bf31e75062014d754eabd0c72f8de88cb7f01f429d66fadaa4"
  license "CC-BY-NC-SA-4.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/deadlore"
  end

  test do
    assert_match "canonical Deadlock Wiki article", shell_output("#{bin}/deadlore --help")
  end
end
