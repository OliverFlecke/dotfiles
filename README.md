# Dotfiles

Managed by [chezmoi](https://chezmoi.io). Covers macOS (aerospace, sketchybar, borders) and Linux/Arch (Hyprland, waybar, noctalia), plus shared shell, editor and git config.

## Setting up a New Machine

- Install `mise` to manage tools with `curl -fsSL https://mise.run | sh`
- Install `chezmoi` with `mise use -g chezmoi` (or `sh -c "$(curl -fsLS get.chezmoi.io)"`)
- Run `chezmoi init --apply $GITHUB_USERNAME`
- Run `mise install` to install the tools listed in `~/.config/mise/config.toml`
- Run `~/.install/setup.sh` to set up standard tools
  - Installs `zsh` and makes it the default shell. Plugins are bootstrapped by `zinit` on first start; the prompt is `oh-my-posh`.
  - On macOS, brew is installed too. `~/.install/macOS.sh` applies macOS defaults, fonts and aerospace (run it manually).

## Layout

| Path | Purpose |
| --- | --- |
| `dot_zshrc`, `dot_zshenv`, `dot_tmux.conf`, `dot_gitconfig` | Shell, multiplexer and git |
| `dot_config/` | App config (`exact_` dirs are kept in sync, unmanaged files are removed) |
| `dot_config/exact_mise/` | Tool versions (`config.toml`) and lockfile |
| `dot_config/exact_nvim/` | Neovim (native `vim.pack`, lockfile in `nvim-pack-lock.json`) |
| `exact_dot_install/` | Bootstrap scripts, deployed to `~/.install` |

## Automation

- **CI** (`.github/workflows/ci.yml`): `chezmoi apply --dry-run`, shellcheck on install scripts, `zsh -n`, taplo on TOML.
- **Renovate** (`renovate.json`): bumps pinned tools in the mise config, the `hk` version in `config.pkl`, GitHub Actions and `flake.lock`. Needs the [Renovate GitHub app](https://github.com/apps/renovate) enabled on this repo. Tools set to `"latest"` and `nvim-pack-lock.json` are not touched by it (update those with `mise upgrade` and `vim.pack.update()`).
