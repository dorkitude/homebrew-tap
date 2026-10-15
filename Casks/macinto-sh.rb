cask "macinto-sh" do
  version "0.1.101"
  sha256 "f7a2f2b78f1d3e33ce64c3e8446e2208c731e24f45d95b02794af9a74f9c874b"

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
    Finish setup: run `open -a Macinto.sh` (or any `macinto.sh` command).
    Macinto.sh needs Accessibility and Screen Recording, and stays disabled
    until you enable it from its window or menu bar icon.
  EOS
end
