class EnronqaCli < Formula
  desc "EnronQA dataset access and reproducible LLM answer evaluation"
  homepage "https://github.com/dorkitude/EnronQA-cli"
  url "https://github.com/dorkitude/EnronQA-cli/releases/download/v0.2.0/enronqa_cli-0.2.0.tar.gz"
  version "0.2.0"
  sha256 "ba108a26692a16cfe96e8f0e37df5d78e2cf2c0717795bc0153d43f79f794743"
  license "MIT"

  depends_on "python@3.12"
  depends_on "uv" => :build

  def install
    python = Formula["python@3.12"].opt_bin/"python3.12"
    system "uv", "venv", "--python", python, libexec
    system "uv", "pip", "install", "--python", libexec/"bin/python",
           "--require-hashes", "-r", buildpath/"packaging/requirements-release.txt"
    system "uv", "pip", "install", "--python", libexec/"bin/python",
           "--no-deps", buildpath
    bin.install_symlink libexec/"bin/enronqa"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/enronqa --version")
    assert_match "fetch", shell_output("#{bin}/enronqa --help")
    assert_match "nonblank string answer", shell_output("#{bin}/enronqa instructions")
  end
end
