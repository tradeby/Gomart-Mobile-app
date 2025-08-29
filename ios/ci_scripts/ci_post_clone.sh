#!/bin/sh

# Fail this script if any subcommand fails.
set -e

# The default execution directory of this script is the ci_scripts directory.
cd "$CI_PRIMARY_REPOSITORY_PATH" # Change working directory to the root of your cloned repo.

# Install Flutter using git.
git clone https://github.com/flutter/flutter.git --depth 1 -b 3.24.5 "$HOME/flutter"

# Update PATH to include Flutter's bin directory.
export PATH="$HOME/flutter/bin:$PATH"

# Verify Flutter installation.
flutter --version

flutter doctor

# Install Flutter artifacts for iOS (--ios), or macOS (--macos) platforms.
flutter precache --ios

# Install Flutter dependencies.
flutter clean
flutter pub get

# Install CocoaPods using Homebrew.
HOMEBREW_NO_AUTO_UPDATE=1 brew install cocoapods

# Install CocoaPods dependencies.
cd ios && pod install --repo-update # Run `pod install` in the `ios` directory.

exit 0
