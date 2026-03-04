# LocaleKit CLI

A command-line tool for managing app localization across Xcode, Android, Flutter, and React Native projects.

## Installation

### Homebrew (Recommended)

```bash
brew tap hexagone-studio/localekit https://github.com/hexagone-studio/LocaleKit.git
brew install localekit-cli
```

To update:

```bash
brew upgrade localekit-cli
```

### Direct Download

Download the latest release from [GitHub Releases](https://github.com/hexagone-studio/LocaleKit/releases).

```bash
# Download (replace VERSION with the actual version, e.g., 0.6.0)
curl -L -o localekit.tar.gz \
  https://github.com/hexagone-studio/LocaleKit/releases/download/VERSION/localekit-cli-VERSION-darwin-universal.tar.gz

# Verify checksum
curl -L -o localekit.sha256 \
  https://github.com/hexagone-studio/LocaleKit/releases/download/VERSION/localekit-cli-VERSION-darwin-universal.tar.gz.sha256
shasum -a 256 -c localekit.sha256

# Extract and install
tar -xzf localekit.tar.gz
sudo mv localekit /usr/local/bin/
localekit --version
```

### Build from Source

Requires macOS 26.0+ and Xcode 26.0+.

```bash
git clone https://github.com/hexagone-studio/localekit-macos.git
cd localekit-macos/LocaleKitCore
swift build -c release --arch arm64 --arch x86_64
sudo cp .build/release/LocaleKitCLI /usr/local/bin/localekit
```

## Quick Start

```bash
# Scan a project for localization files
localekit scan ./MyApp

# Show translation status
localekit status ./MyApp

# Translate missing keys
localekit translate ./MyApp --engine deepl

# Validate localization files
localekit validate ./MyApp

# Convert between formats
localekit convert Localizable.xcstrings --to arb

# Export to a different format
localekit export ./MyApp --format json --output ./export/
```

## Commands

| Command | Description |
|---------|-------------|
| `login` | Authenticate with the LocaleKit service |
| `logout` | Sign out of the current session |
| `whoami` | Display the currently authenticated user |
| `scan` | Discover localization files in a project |
| `status` | Show translation progress and missing keys |
| `translate` | Translate missing or outdated keys |
| `validate` | Check localization files for errors |
| `export` | Export translations to a target format |
| `convert` | Convert between localization file formats |

Run `localekit <command> --help` for detailed usage of any command.

## Configuration

### Configuration File

Create a `.localekitrc.yml` in your project root:

```yaml
workspace: ./MyApp
sourceLanguage: en-US
targetLanguages:
  - de-DE
  - fr-FR
  - ja-JP
  - es-ES
engine: deepl
apiKey: ${DEEPL_API_KEY}
verbose: false
```

### Environment Variables

```bash
# DeepL
export DEEPL_API_KEY="your-deepl-api-key"

# OpenAI
export OPENAI_API_KEY="your-openai-api-key"

# Generic fallback
export LOCALEKIT_API_KEY="your-api-key"
```

## Shell Completions

### Bash

```bash
localekit --generate-completion-script bash > /etc/bash_completion.d/localekit
```

### Zsh

```bash
mkdir -p ~/.zsh/completions
localekit --generate-completion-script zsh > ~/.zsh/completions/_localekit
# Add to ~/.zshrc if needed:
# fpath=(~/.zsh/completions $fpath)
# autoload -Uz compinit && compinit
```

### Fish

```bash
localekit --generate-completion-script fish > ~/.config/fish/completions/localekit.fish
```

## Uninstalling

### Homebrew

```bash
brew uninstall localekit-cli
brew untap hexagone-studio/localekit
```

### Manual

```bash
sudo rm /usr/local/bin/localekit
```

## Troubleshooting

### "localekit: command not found"

Ensure `/usr/local/bin` is in your PATH:

```bash
echo $PATH | grep -q "/usr/local/bin" || echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
```

### Gatekeeper blocks the binary

The CLI is signed and notarized. If you still see a warning after a direct download:

```bash
xattr -d com.apple.quarantine /usr/local/bin/localekit
```

### Permission denied

Use `sudo` for system-wide install, or install to a user directory:

```bash
mkdir -p ~/bin
mv localekit ~/bin/
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc
```
