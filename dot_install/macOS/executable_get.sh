#!/usr/bin/env sh

brews=( brew.essentials )
#casks=( cask.essentials )

for file in "${brews[@]}"; do
	cat $file | while read p; do
		if ! command -v $p &> /dev/null
		then
			echo "Installing $p"
			brew install $p
		else
			echo "$p is already installed"
		fi
	done
done
