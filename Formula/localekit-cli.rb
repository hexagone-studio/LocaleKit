# Homebrew formula for LocaleKit CLI
# Auto-updated by CI on each release — do not edit version/sha256 manually.

class LocalekitCli < Formula
  desc "CLI tool for managing app localization across Xcode, Android, Flutter, and React Native"
  homepage "https://github.com/hexagone-studio/LocaleKit"
  version "0.9.13"
  license "MIT"

  url "https://github.com/hexagone-studio/LocaleKit/releases/download/#{version}/localekit-cli-#{version}-darwin-universal.tar.gz"
  sha256 "6b6f2a684e6b04e93fa17385e6d5730e27a3b5aec2e712f9c57566541c6a42f8"

  depends_on :macos

  def install
    bin.install "localekit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/localekit --version")
  end
end
