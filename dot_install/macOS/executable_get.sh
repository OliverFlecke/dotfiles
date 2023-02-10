#!/usr/bin/env sh

# Install all basic tools needed on macOS

dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

while IFS="" read -r tool || [ -n "$t" ]
do
	echo "Installing $tool"
	if ! command -v $p &> /dev/null
	then
		echo "Installing $p"
		brew install $p
	else
		echo "$p is already installed"
		brew upgrade $p
	fi
done < $dir/brew.essentials


while IFS="" read -r tool || [ -n "$t" ]
do
	echo "Installing $tool"

	if ! command -v $p &> /dev/null
	then
		echo "Installing $p"
		brew install --cask $p
	else
		echo "$p is already installed"
		brew upgrade --cask $p
	fi
done < $dir/cask.essentials
