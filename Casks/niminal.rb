cask "niminal" do
  version "0.0.1"
  sha256 "1e7014ef1d294e2f3747291f501554fc6cd1542d8d8c35aa901cb2ffe7913213"

  url "https://github.com/martineastwood/niminal/releases/download/v#{version}/Niminal-#{version}-macos-arm64.dmg"
  name "Niminal"
  desc "Live-coding audio language with the audio engine built in"
  homepage "https://github.com/martineastwood/niminal"

  depends_on arch: :arm64
  depends_on macos: :ventura

  # The download is one folder: Stage, which has the audio engine inside it, the `niminal` command (offline
  # render, `niminal play`, and the language server), the VS Code extension and the examples. It is installed as it comes.
  binary "#{appdir}/Niminal/bin/niminal"
  artifact "Niminal", target: "#{appdir}/Niminal"

  # The apps are ad-hoc signed, not notarized, so macOS would stop each one on first use.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "."], chdir: "Niminal", base: :appdir
  end

  zap trash: "~/.niminal"
end
