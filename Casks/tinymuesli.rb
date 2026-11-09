cask "tinymuesli" do
  version "0.5.0"
  sha256 "012bea95e87e44e00732255af6b4479724f5672dea991fd411b0678195094321"

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
  binary "#{appdir}/tinyMuesli.app/Contents/MacOS/tinyMuesli", target: "tinymuesli"

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
