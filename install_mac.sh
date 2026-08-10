#!/bin/bash
set -euo pipefail

#############################################################################################
# shell

#cat /etc/shells
#brew install bash
#echo $(brew --prefix)/bin/bash | sudo tee -a /private/etc/shells
#chsh -s $(brew --prefix)/bin/bash

#############################################################################################
# font
# https://www.nerdfonts.com/font-downloads
#
brew install --cask font-source-code-pro
brew install --cask font-sauce-code-pro-nerd-font
brew install --cask font-ubuntu-nerd-font

#############################################################################################
# terminal

# kitty
curl -fsSL https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# zsh
[ -d "$HOME/.oh-my-zsh" ] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# tmux
brew install tmux
mkdir -p "$HOME/.config/tmux/plugins"
[ -d "$HOME/.config/tmux/plugins/tpm" ] || git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
[ -d "$HOME/.config/tmux/plugins/catppuccin-tmux" ] || git clone -b v2.1.3 https://github.com/catppuccin/tmux.git "$HOME/.config/tmux/plugins/catppuccin-tmux"

# herdr
brew install herdr

# starship
brew install starship

#############################################################################################
# commandline tools
brew install eza bat ripgrep ast-grep zoxide entr thefuck
brew install ranger ncdu
brew install btop htop
brew install unzip gzip
brew install curl wget rsync lynx
brew tap natesales/repo https://github.com/natesales/repo
brew install natesales/repo/q
brew install xsv jq jc fx sd
brew install imagemagick

#############################################################################################
# file manager

# mc
brew install mc
TMPDIR=/tmp/mc-onedark
[ -d "$TMPDIR" ] && rm -rf "$TMPDIR"
git clone https://github.com/DeadNews/mc-onedark.git "$TMPDIR"
mkdir -p "$HOME/.local/share/mc"
cp -r "$TMPDIR/skins" "$HOME/.local/share/mc"

# yazi
brew install yazi ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide resvg imagemagick font-symbols-only-nerd-font
[ -d "$HOME/.config/yazi/flavors/flexoki-dark.yazi" ] || ya pkg add gosxrgxx/flexoki-dark

#############################################################################################
# nvim

# fzf
brew install fzf fd
$(brew --prefix)/opt/fzf/install

# latex
brew list --cask mactex >/dev/null 2>&1 || brew install --cask mactex
pipx install pylatexenc
pipx install jupytext

# lua
brew install luarocks
luarocks --local --lua-dir="$(brew --prefix luajit)" install magick

# npm
brew install npm
npm install --global neovim
npm install --global prettier
npm install --global markdownlint-cli2
npm install --global markdown-toc
npm install --global @mermaid-js/mermaid-cli

# rust
brew install rustup
rustup default stable
rustup update
rustup component add rust-analyzer
cargo install tree-sitter-cli gitlab-ci-ls ast-grep

#
brew install neovim

#############################################################################################
# git
brew install git git-delta lazygit

#############################################################################################
# docker
brew install lazydocker

#############################################################################################
# ai
brew install copilot-cli gh
