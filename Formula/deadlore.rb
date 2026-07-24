class Deadlore < Formula
  desc "Source-aware CLI for the community-maintained Deadlock Wiki"
  homepage "https://github.com/dorkitude/deadlore"
  url "https://github.com/dorkitude/deadlore/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "0b9d7354270d58b09054abbfbdb6234321cebadaf88affb525a4576be4e20583"
  license "CC-BY-NC-SA-4.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/deadlore"
  end

  test do
    assert_match "canonical Deadlock Wiki article", shell_output("#{bin}/deadlore --help")
  end
end
