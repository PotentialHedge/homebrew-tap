cask "publibike" do
  version "1.0"
  sha256 "b1b22405d048d1acfd14dba79a9b7de4d686dbc675cee228f6b1faa78ab3591f"

  url "https://github.com/PotentialHedge/publibike-bar/releases/download/v#{version}/PubliBike-#{version}.zip"
  name "PubliBike"
  desc "Menu bar app showing live PubliBike / Velospot bike availability"
  homepage "https://github.com/PotentialHedge/publibike-bar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "PubliBike.app"

  # Not signed with an Apple Developer ID: drop the download quarantine so Gatekeeper doesn't block it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/PubliBike.app"],
        writable_paths: ["PubliBike.app"],
        writable_base:  :appdir
  end

  uninstall quit: "local.publibike.bar"

  zap trash: [
    "~/Library/Caches/PubliBikeBar",
    "~/Library/Preferences/local.publibike.bar.plist",
  ]
end
