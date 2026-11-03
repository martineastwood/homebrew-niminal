# Homebrew tap for Niminal

Installs the [Niminal](https://github.com/martineastwood/niminal) macOS download (Apple Silicon, macOS 13+): Tracker, Stage, the `niminal` and `niminal-live` commands, and the examples.

```sh
brew tap martineastwood/niminal
brew trust --cask martineastwood/niminal/niminal   # recent Homebrew only; older versions have no `brew trust`
brew install --cask martineastwood/niminal/niminal
```

The apps are not notarized by Apple. The cask clears the download's quarantine mark so they open without the "unidentified developer" warning.

Upgrading: `brew upgrade --cask niminal`. Uninstalling: `brew uninstall --cask niminal`.
