# Homebrew formula for LocaleKit CLI
# Auto-updated by CI on each release — do not edit version/sha256 manually.

class LocalekitCli < Formula
  desc "CLI tool for managing app localization across Xcode, Android, Flutter, and React Native"
  homepage "https://github.com/hexagone-studio/LocaleKit"
  version "0.7.2"
  license "MIT"

  url "https://github.com/hexagone-studio/LocaleKit/releases/download/#{version}/localekit-cli-#{version}-darwin-universal.tar.gz"
  sha256 "ec273f963e8551e854899a11869a65650c080a4edc498a0f55893d0c13236f5b"

  depends_on :macos

  def install
    bin.install "localekit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/localekit --version")
  end
end
