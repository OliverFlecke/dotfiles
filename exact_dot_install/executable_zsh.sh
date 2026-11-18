#!/usr/bin/env sh

# Usage: ./zsh.sh
#
# Install zsh and make it the default shell. Plugins are managed by zinit from
# `~/.zshrc` (bootstrapped on first shell start), and the prompt by oh-my-posh.
#
# Note: Linux support requires `apt`, and `apt update` should have been run recently.

if [ "$(uname)" = "Linux" ]; then
  echo 'Installing zsh for linux...'
  apt install zsh -y
elif [ "$(uname)" = "Darwin" ]; then
  echo 'Installing zsh for macOS'
  brew install zsh
fi

zsh_path=$(command -v zsh)
if [ "$SHELL" != "$zsh_path" ]; then
  echo "Setting default shell to $zsh_path"
  chsh -s "$zsh_path"
fi
