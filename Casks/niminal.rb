cask "niminal" do
  version "0.1.0"
  sha256 "eb757ee415db5e1146ebad7e4768abc51f5ce5cf50c4c0b24baf38e737e138ea"

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
