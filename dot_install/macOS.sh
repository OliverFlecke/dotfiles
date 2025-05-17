#!/usr/bin/env sh

# Install minimal necessary configurations and settings for macOS
dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

$dir/macOS/defaults.me.sh
$dir/macOS/defaults.dock.sh
$dir/macOS/fonts.sh
$dir/macOS/get.sh

brew install --cask nikitabobko/tap/aerospace
