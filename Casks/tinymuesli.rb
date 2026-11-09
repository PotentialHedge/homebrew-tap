cask "tinymuesli" do
  version "0.3.0"
  sha256 "98338693b815521300d7bb2328c0fdfbda0f5d69ee3f446739a7d3d738572f09"

  url "https://github.com/PotentialHedge/tinymuesli/releases/download/v#{version}/tinyMuesli-#{version}.zip"
  name "tinyMuesli"
  desc "Local, private meeting notes"
  homepage "https://github.com/PotentialHedge/tinymuesli"

  livecheck do
    url "https://github.com/PotentialHedge/tinymuesli/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "tinyMuesli.app"

  zap trash: [
    "~/.config/tinymuesli",
    "~/Library/Caches/com.tinymuesli.tinyMuesli",
    "~/Library/HTTPStorages/com.tinymuesli.tinyMuesli",
    "~/Library/Logs/tinyMuesli",
    "~/Library/Preferences/com.tinymuesli.tinyMuesli.plist",
  ]

  caveats <<~EOS
    tinyMuesli isn't notarized by Apple, so macOS refuses to open it the first time.
    Click Done, then System Settings > Privacy & Security > Open Anyway.
    Updates install from "Check for Updates…" in its menu.
  EOS
end
