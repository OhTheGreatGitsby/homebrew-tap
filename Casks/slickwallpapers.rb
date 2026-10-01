cask "slickwallpapers" do
  version "1.0.0"
  sha256 "fa29dbe25e89044a2b2b4c0f39d49754a173cfb2ba5f9f0f215385a09b7c9b91"

  url "https://github.com/OhTheGreatGitsby/SlickWallpapers/releases/download/v#{version}/SlickWallpapers.zip"
  name "SlickWallpapers"
  desc "Smooth, animated wallpaper selector"
  homepage "https://github.com/OhTheGreatGitsby/SlickWallpapers"

  depends_on macos: :sonoma

  app "SlickWallpapers.app"

  # The app is ad-hoc signed, not notarized.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/SlickWallpapers.app"]
  end

  uninstall quit: "io.github.ohthegreatgitsby.slickwallpapers"

  zap trash: [
    "~/Library/Application Support/SlickWallpapers",
    "~/Library/Preferences/io.github.ohthegreatgitsby.slickwallpapers.plist",
  ]
end
