cask "niminal" do
  version "0.0.1-alpha.10"
  sha256 "75cdd6b9872a14f50bae3c9689312369b87579365b2726b0ded126c927217553"

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
