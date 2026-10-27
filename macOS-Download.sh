#!/bin/bash
set -e

REPO="Isaac78632926397/Legacy-android-kit_v26"
BRANCH="main"

echo "Legacy Android Kit v26 installer"
echo "Checking for GitHub CLI..."

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI not installed."
  echo "Install it with Homebrew:"
  echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
  echo 'brew install gh'
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "You are not signed in to GitHub."
  echo "Run:"
  echo "gh auth login"
  echo "Then run this script again."
  exit 1
fi

echo "Cloning repo..."
mkdir -p ~/LegacyAndroidKit
cd ~/LegacyAndroidKit

if [ -d "Legacy-android-kit_v26" ]; then
  echo "Repo already exists."
else
  gh repo clone "$REPO" -- --depth 1
fi

echo "Done."
echo "Open:"
echo "~/LegacyAndroidKit/Legacy-android-kit_v26"