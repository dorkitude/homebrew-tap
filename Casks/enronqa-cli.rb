cask "enronqa-cli" do
  version "0.2.1"

  on_macos do
    on_arm do
      sha256 "e8dae75fe97f0a53a080d0f46047b2a4e2fc76570c90857c76846e08662d300f"
      url "https://github.com/dorkitude/EnronQA-cli/releases/download/v#{version}/enronqa-cli_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "1927a981f854b6017b5669a451759237f70bf9413ed6ee31d8de777732defdb0"
      url "https://github.com/dorkitude/EnronQA-cli/releases/download/v#{version}/enronqa-cli_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "ad7faa02d9d887d4a6a5f4192bd22a5645711dce878994a515d8171e5ae1613e"
      url "https://github.com/dorkitude/EnronQA-cli/releases/download/v#{version}/enronqa-cli_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "a27be032c21857e5d6bccfe67e2bfab1d7d1e377207360e8128355f5a060ff51"
      url "https://github.com/dorkitude/EnronQA-cli/releases/download/v#{version}/enronqa-cli_#{version}_linux_amd64.tar.gz"
    end
  end

  name "EnronQA-cli"
  desc "EnronQA dataset access and reproducible LLM answer evaluation"
  homepage "https://github.com/dorkitude/EnronQA-cli"

  livecheck do
    skip "Updated by scripts/publish-packages.sh on release."
  end

  # A self-contained bundle: the executable plus its _internal/ directory
  # (Python runtime and pyarrow). Homebrew links only the executable.
  binary "enronqa/enronqa"

  # Unless the release workflow signed and notarized the bundle, macOS
  # quarantines the executable and every library under _internal/ and refuses
  # to load them, so clear the attribute from the whole bundle.
  postflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-d", "-r", "com.apple.quarantine", "{{staged_path}}/enronqa"], must_succeed: false
    end
  end
end
