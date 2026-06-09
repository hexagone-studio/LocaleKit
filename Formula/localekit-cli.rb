# Homebrew formula for LocaleKit CLI
# Auto-updated by CI on each release — do not edit version/sha256 manually.

class LocalekitCli < Formula
  desc "CLI tool for managing app localization across Xcode, Android, Flutter, and React Native"
  homepage "https://github.com/hexagone-studio/LocaleKit"
  version "0.10.3"
  license "MIT"

  url "https://github.com/hexagone-studio/LocaleKit/releases/download/#{version}/localekit-cli-#{version}-darwin-universal.tar.gz"
  sha256 "79639431372af426f9ea09c76c9e11dfb1ed0837e784f3c576924ec2eeb96ea9"

  depends_on :macos

  def install
    bin.install "localekit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/localekit --version")
  end
end
