# Homebrew formula for LocaleKit CLI
# Auto-updated by CI on each release — do not edit version/sha256 manually.

class LocalekitCli < Formula
  desc "CLI tool for managing app localization across Xcode, Android, Flutter, and React Native"
  homepage "https://github.com/hexagone-studio/LocaleKit"
  version "0.10.1"
  license "MIT"

  url "https://github.com/hexagone-studio/LocaleKit/releases/download/#{version}/localekit-cli-#{version}-darwin-universal.tar.gz"
  sha256 "48881a49aa9691ec99903b2f756ce3ac5b087c7d6920526d214179e636db4f86"

  depends_on :macos

  def install
    bin.install "localekit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/localekit --version")
  end
end
