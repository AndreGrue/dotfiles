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
curl -fsSL https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -sf "$HOME/.local/kitty.app/bin/kitty" "$HOME/.local/kitty.app/bin/kitten" "$HOME/.local/bin/"
cp "$HOME/.local/kitty.app/share/applications/kitty.desktop" "$HOME/.local/share/applications/"
cp "$HOME/.local/kitty.app/share/applications/kitty-open.desktop" "$HOME/.local/share/applications/"
sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" "$HOME/.local/share/applications/kitty"*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" "$HOME/.local/share/applications/kitty"*.desktop
echo 'kitty.desktop' >"$HOME/.config/xdg-terminals.list"

# zsh
sudo apt-get install -y zsh tmux
[ -d "$HOME/.oh-my-zsh" ] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# tmux
mkdir -p "$HOME/.config/tmux/plugins"
[ -d "$HOME/.config/tmux/plugins/tpm" ] || git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
[ -d "$HOME/.config/tmux/plugins/catppuccin-tmux" ] || git clone -b v2.1.3 https://github.com/catppuccin/tmux.git "$HOME/.config/tmux/plugins/catppuccin-tmux"

# herdr
curl -fsSL https://herdr.dev/install.sh | sh

# starship
curl -sS https://starship.rs/install.sh | sh

#############################################################################################
# commandline tools

sudo apt-get install -y \
  eza bat ripgrep zoxide entr thefuck \
  ncdu btop htop curl wget rsync lynx unzip gzip tar \
  imagemagick libmagickwand-dev libgraphicsmagick1-dev chafa

#############################################################################################
# file manager

# mc
sudo apt-get install -y mc ffmpeg 7zip jq poppler-utils fd-find fzf
mkdir -p "$HOME/.local/bin"
ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"

TMPDIR=/tmp/mc-onedark
[ -d "$TMPDIR" ] && rm -rf "$TMPDIR"
git clone https://github.com/DeadNews/mc-onedark.git "$TMPDIR"
mkdir -p "$HOME/.local/share/mc"
cp -r "$TMPDIR/skins" "$HOME/.local/share/mc"

# yazi

#############################################################################################
# nvim

# fzf
sudo apt-get purge -y fzf
git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
"$HOME/.fzf/install"

# latex
sudo apt-get install -y texlive-latex-base bibtex biber latexmk
pipx install pylatexenc
pipx install jupytext

# lua
sudo apt-get install -y luarocks
sudo luarocks install magick dkjson

# npm
sudo apt-get install -y npm
sudo npm install --global neovim prettier markdownlint-cli2 markdown-toc @mermaid-js/mermaid-cli homeassistant-lsp

# rust
sudo apt-get purge -y tree-sitter
sudo apt-get install -y rustup
rustup default stable
rustup update
rustup component add rust-analyzer
cargo install tree-sitter-cli gitlab-ci-ls ast-grep
cargo install --force yazi-build

# python
sudo apt-get install -y python3-pip python3-venv python3-neovim

# neovim
sudo apt-get purge -y neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

#############################################################################################
# git

sudo apt-get install -y git git-delta
LAZYGIT_VERSION=$(curl -fsSL "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -fLo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

#############################################################################################
# docker

sudo apt-get install -y docker.io docker-compose-v2
curl -fsSL https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

#############################################################################################
# ai
