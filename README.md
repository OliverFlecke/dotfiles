# Dotfiles

Managed by [chezmoi](https://chezmoi.io).

## Setting up a new machine

- Install `chezmoi` with brew or `sh -c "$(curl -fsLS get.chezmoi.io)`
- Run `chezmoi init --apply $GITHUB_USERNAME`
- Run `~/.install/setup.sh` to setup standard tools
  - This will install `zsh` as your default shell with all configurations from this repo. Will consider adding support for installing `fish` instead, as I'm playing around with that.
  - On macOS, brew will also be installed

