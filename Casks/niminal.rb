cask "niminal" do
  version "0.0.1-alpha.7"
  sha256 "4c25b7c2c81578576f9fb88b034ce34bc8e57d81da584c7a900ffdf1f5f849e9"

  url "https://github.com/martineastwood/niminal/releases/download/v#{version}/Niminal-#{version}-macos-arm64.dmg"
  name "Niminal"
  desc "Live-coding audio language with a server, a tracker and a stage"
  homepage "https://github.com/martineastwood/niminal"

  depends_on arch: :arm64
  depends_on macos: :ventura

  # The download is one folder of apps and tools that find each other, so it is installed as it comes.
  binary "#{appdir}/Niminal/bin/niminal"
  binary "#{appdir}/Niminal/bin/niminal-live"
  artifact "Niminal", target: "#{appdir}/Niminal"

  # The apps are ad-hoc signed, not notarized, so macOS would stop each one on first use.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "."], chdir: "Niminal", base: :appdir
  end

  zap trash: "~/.niminal"
end
