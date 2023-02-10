#!/usr/bin/env sh

# Usage: ./zsh.sh

# Install the zsh shell and set it as the default shell, along with `oh-my-zsh` and 
# powerline10k with custom shell. All configuration files are already part of this repo
# and should be automatically copied over.

# Note: If running on Linux, only machines with `apt` is currently supported, and it is 
# expected that `apt update` has been run relatively recently. 


if [ "$(uname)" = "Linux" ]; then
  echo 'Installing zsh for linux...'
  apt install zsh -y
elif [ "$(uname)" = "darwin" ]; then 
  echo 'Install zsh for macOS'
  brew install zsh
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh"
  CHSH=yes RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
  # mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
fi

POWERLINE_PATH=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "Path: $POWERLINE_PATH"

if [ -d "$POWERLINE_PATH" ]; then
  git -C $POWERLINE_PATH pull
else 
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $POWERLINE_PATH
fi
