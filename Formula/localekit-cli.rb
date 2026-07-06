# Homebrew formula for LocaleKit CLI
# Auto-updated by CI on each release — do not edit version/sha256 manually.

class LocalekitCli < Formula
  desc "CLI tool for managing app localization across Xcode, Android, Flutter, and React Native"
  homepage "https://github.com/hexagone-studio/LocaleKit"
  version "0.19.0"
  license "MIT"

  url "https://github.com/hexagone-studio/LocaleKit/releases/download/#{version}/localekit-cli-#{version}-darwin-universal.tar.gz"
  sha256 "ff10b8b2ba623e0dc1eb2dd334b0bebe8946a41f80ed422d22593258ebd76182"

  depends_on :macos

  def install
    bin.install "localekit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/localekit --version")
  end
end
