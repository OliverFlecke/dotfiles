#!/usr/bin/env sh

# Usage: Run script to setup new machine

dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
platform=$(uname)

# Update/install the respective package manager
if [ $platform = "Linux" ]; then
  apt update
else
  $dir/brew.sh
fi

# Install preferred shell
# TODO: Consider adding support for `fish`
$dir/zsh.sh
