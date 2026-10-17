class Skimmer < Formula
  desc "Skim pages, files, and lists with Jev: keep only what helps with your goal. Saves agent tokens."
  homepage "https://github.com/dorkitude/skimmer"
  url "https://github.com/dorkitude/skimmer/archive/refs/tags/v0.1.103.tar.gz"
  sha256 "768a71b220520b2358d12f573a10ff944b6098f5236e169df689a0db4661df0a"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/dorkitude/skimmer/cmd.Version=#{version}"), "."
    generate_completions_from_executable(bin/"skimmer", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skimmer --version")
    assert_match "skim_document", shell_output("#{bin}/skimmer prompts list")
  end
end
