#!/bin/bash
set -euo pipefail

#############################################################################################
# shell

#############################################################################################
# font
# https://www.nerdfonts.com/font-downloads
#
FONTPKG=SourceCodePro.zip
FONTPATH=https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1
mkdir -p "$HOME/.local/share/fonts"
wget -P "$HOME/.local/share/fonts" "$FONTPATH/$FONTPKG"
unzip -o "$HOME/.local/share/fonts/$FONTPKG" -d "$HOME/.local/share/fonts"
rm "$HOME/.local/share/fonts/$FONTPKG"
fc-cache -fv

#############################################################################################
# terminal

# kitty
sudo pacman -S --noconfirm kitty imagemagick chafa

# zsh
sudo pacman -S --noconfirm zsh
[ -d "$HOME/.oh-my-zsh" ] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# tmux
sudo pacman -S --noconfirm tmux
mkdir -p "$HOME/.config/tmux/plugins"
[ -d "$HOME/.config/tmux/plugins/tpm" ] || git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
[ -d "$HOME/.config/tmux/plugins/catppuccin-tmux" ] || git clone -b v2.1.3 https://github.com/catppuccin/tmux.git "$HOME/.config/tmux/plugins/catppuccin-tmux"

# herdr
curl -fsSL https://herdr.dev/install.sh | sh

# starship
sudo pacman -S --noconfirm starship

#############################################################################################
# commandline tools
sudo pacman -S --noconfirm \
	eza bat ripgrep ast-grep zoxide entr thefuck fzf fd \
	ranger mc ncdu btop htop \
	curl wget rsync lynx unzip gzip tar

#############################################################################################
# file manager

# mc
sudo pacman -S --noconfirm mc
TMPDIR=/tmp/mc-onedark
[ -d "$TMPDIR" ] && rm -rf "$TMPDIR"
git clone https://github.com/DeadNews/mc-onedark.git "$TMPDIR"
mkdir -p "$HOME/.local/share/mc"
cp -r "$TMPDIR/skins" "$HOME/.local/share/mc"

# yazi
sudo pacman -S --noconfirm yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick

# superfile
sudo pacman -S --noconfirm superfile

#############################################################################################
# nvim

# fzf

# latex
sudo pacman -S --noconfirm texlive-latex-base bibtex biber latexmk
pipx install pylatexenc
pipx install jupytext

# lua
sudo pacman -S --noconfirm luarocks

# npm
sudo pacman -S --noconfirm nodejs npm
sudo npm install --global neovim prettier markdownlint-cli2 markdown-toc @mermaid-js/mermaid-cli

# rust
sudo pacman -S --noconfirm rustup
rustup default stable
rustup update
rustup component add rust-analyzer
cargo install tree-sitter-cli gitlab-ci-ls ast-grep

# python
sudo pacman -S --noconfirm python3 python-pip python-virtualenv python-pynvim

# neovim
sudo pacman -S --noconfirm neovim

#############################################################################################
# git
sudo pacman -S --noconfirm git git-delta lazygit

#############################################################################################
# docker
sudo pacman -S --noconfirm docker docker-compose lazydocker

#############################################################################################
# ai
