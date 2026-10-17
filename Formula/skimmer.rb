class Skimmer < Formula
  desc "Skim pages, files, and lists with Jev: keep only what helps with your goal. Saves agent tokens."
  homepage "https://github.com/dorkitude/skimmer"
  version "0.1.103"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dorkitude/skimmer/releases/download/v0.1.103/skimmer_0.1.103_darwin_arm64.tar.gz"
      sha256 "5d1aaee5e93046b537448130db149d260c0ee7d53e68b2d2e824465a48ed94a6"
    end
    on_intel do
      url "https://github.com/dorkitude/skimmer/releases/download/v0.1.103/skimmer_0.1.103_darwin_amd64.tar.gz"
      sha256 "f9c909117d94fc9ce727301b6853657fe4211df583890069f89447aa6412282d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dorkitude/skimmer/releases/download/v0.1.103/skimmer_0.1.103_linux_arm64.tar.gz"
      sha256 "e9024530799a75d03c0a93580421654394619108b9900d2627df5780f57eb100"
    end
    on_intel do
      url "https://github.com/dorkitude/skimmer/releases/download/v0.1.103/skimmer_0.1.103_linux_amd64.tar.gz"
      sha256 "cdf05e8b185663dfa1010eb5fc9ee80de9e2571e8e395d5620954a66c58cf6c1"
    end
  end

  def install
    bin.install "skimmer"
    generate_completions_from_executable(bin/"skimmer", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skimmer --version")
    assert_match "skim_document", shell_output("#{bin}/skimmer prompts list")
  end
end
