cask "niminal" do
  version "0.0.1-alpha.8"
  sha256 "862046633e572c39aeac9b4b2ddbd2a0cf891df2cbced04024ec1862c8b4dc76"

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
