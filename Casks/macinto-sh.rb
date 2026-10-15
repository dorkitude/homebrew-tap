cask "macinto-sh" do
  version "0.1.102"
  sha256 "8593ba8de48bc38e8bb439c7ef06b97670bef1e41cff08dda3451f64b79248dc"

  url "https://github.com/dorkitude/macinto-sh/releases/download/v#{version}/Macinto.sh-#{version}.dmg"
  name "Macinto.sh"
  desc "Lets agents control your Mac through a time-limited CLI and MCP server"
  homepage "https://github.com/dorkitude/macinto-sh"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Macinto.sh.app"
  binary "#{appdir}/Macinto.sh.app/Contents/Helpers/macinto.sh"

  uninstall quit: "com.dorkitude.macinto.sh"

  zap trash: [
    "~/Library/Application Support/macinto",
    "~/Library/Logs/macinto.log",
    "~/Library/Preferences/com.dorkitude.macinto.sh.plist",
  ]

  caveats <<~EOS
    Finish setup: run `macinto.sh setup`.
    Macinto.sh needs Accessibility and Screen Recording, and stays disabled
    until you enable it from its window or menu bar icon.
  EOS
end
