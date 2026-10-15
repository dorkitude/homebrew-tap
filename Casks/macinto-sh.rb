cask "macinto-sh" do
  version "0.1.103"
  sha256 "980dd61942c3f1f71d6df8e394163380af2e0a342cc49db51b69581259dd4753"

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
