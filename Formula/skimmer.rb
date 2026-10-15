class Skimmer < Formula
  desc "Skim pages, files, and lists with Jev: keep only what helps with your goal. Saves agent tokens."
  homepage "https://github.com/dorkitude/skimmer"
  url "https://github.com/dorkitude/skimmer/archive/refs/tags/v0.1.102.tar.gz"
  sha256 "dd9f97d3bc3f879ac00b58825418b4d2557b9c9b43060e3b276e4cf8525dd912"
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
