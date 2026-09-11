class EnronqaCli < Formula
  desc "EnronQA dataset access and reproducible lexical answer evaluation"
  homepage "https://github.com/dorkitude/EnronQA-cli"
  url "https://github.com/dorkitude/EnronQA-cli/releases/download/v0.1.0/enronqa_cli-0.1.0.tar.gz"
  version "0.1.0"
  sha256 "dcb61521c1f2ad7bc42dc226756f9e8e4b60ad0b472597bda6580facf026eab0"
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
    assert_match "0.1.0", shell_output("#{bin}/enronqa --version")
    assert_match "fetch", shell_output("#{bin}/enronqa --help")
    assert_match "I don't know", shell_output("#{bin}/enronqa instructions")
  end
end
