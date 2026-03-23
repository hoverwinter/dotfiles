# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repo managing dev environment configs for Vim, Emacs, Zsh, Tmux, and Terminator. Originally Ubuntu/Debian-centric (`apt-get`, GNOME `gsettings`), with an `oxs` branch for macOS adaptation.

## Setup Commands

```bash
# Initial clone with submodules
git clone --recursive <repo-url>
# Or after clone:
git submodule update --init --recursive

# Install system packages + Monaco font (requires root, Ubuntu/Debian)
sudo ./install.sh

# Create symlinks for terminator, oh-my-zsh, tmux
./config.sh

# Vim setup (Vundle + symlinks)
./vim/install.sh

# Emacs setup (manual symlink)
ln -s ~/dotfiles/emacs.d ~/.emacs.d
```

There are no build, test, or lint commands in this repo.

## Architecture

### Installation Strategy
Hand-rolled bash scripts with manual symlinks (no stow, dotbot, or Makefile). All scripts back up existing configs with a timestamp suffix before overwriting.

- `install.sh` — System package installation via `apt-get` + Monaco font install
- `config.sh` — Symlink creation for terminator, oh-my-zsh, tmux configs
- `vim/install.sh` — Vim-specific setup: clones Vundle, creates symlinks, runs `vim +PluginInstall`

### Git Submodules

Three submodules (defined in `.gitmodules`):

| Path | Repo |
|------|------|
| `vim/` | `hoverwinter/vim` |
| `emacs.d/` | `hoverwinter/emacs.d` |
| `shell/oh-my-zsh/` | `robbyrussell/oh-my-zsh` |

Vim and Emacs configs are maintained as separate repos by the same author. Always use `--recursive` when cloning or run `git submodule update --init --recursive`.

### Symlink Mapping

| Source | Target |
|--------|--------|
| `terminator/config` | `~/.config/terminator/config` |
| `shell/oh-my-zsh/` | `~/.oh-my-zsh` |
| `tmux/tmux.conf` | `~/.tmux.conf` |
| `vim/vimrc` | `~/.vimrc` |
| `vim/vimrc.bundles` | `~/.vimrc.bundles` |
| `vim/` | `~/.vim` |
| `emacs.d/` | `~/.emacs.d` |

### Key Config Details

- **Tmux**: Custom prefix `C-f`, vim-style pane navigation, zsh as default shell
- **Vim**: Uses Vundle for plugin management; config split into `vimrc` (settings) and `vimrc.bundles` (plugins + plugin configs)
- **Emacs**: Modular architecture — `init.el` loads ~25 modules from `init.d/` directory; uses ELPA for packages
- **Terminator**: Monaco font, transparent background, auto-launches tmux

### Branches

- `master` — Main branch (Ubuntu/Debian target)
- `oxs` — macOS adaptation branch
