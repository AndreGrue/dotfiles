#!/bin/bash

#############################################################################################
# font
# https://www.nerdfonts.com/font-downloads
#
FONTPKG=SourceCodePro.zip
FONTPATH=https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1
wget -P ~/.local/share/fonts $FONTPATH/$FONTPKG &&
  cd ~/.local/share/fonts &&
  unzip $FONTPKG &&
  rm $FONTPKG &&
  fc-cache -fv

#############################################################################################
# common
sudo pacman -S --noconfirm eza bat ripgrep ast-grep zoxide entr thefuck fzf fd
sudo pacman -S --noconfirm mc ncdu btop htop
sudo pacman -S --noconfirm curl wget rsync lynx
sudo pacman -S --noconfirm unzip gzip tar

#############################################################################################
# terminal

# starship
sudo pacman -S --noconfirm starship

# kitty
sudo pacman -S --noconfirm kitty imagemagick chafa

# zsh
sudo pacman -S --noconfirm zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# tmux
sudo pacman -S --noconfirm tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/captpuccin-tmux

# file manager - yazi, see rust
sudo pacman -S --noconfirm yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick

#############################################################################################
# nvim

# latex
sudo apt-get install texlive-latex-base
sudo apt-get install -y bibtex biber latexmk
pipx install pylatexenc
pipx install jupytext

# lua
sudo pacman -S --noconfirm luarocks
# sudo luarocks install magick

# rust
sudo pacman -S --noconfirm rustup
rustup default stable
rustup update
# rustup component add rust-analyzer
# cargo install tree-sitter-cli gitlab-ci-ls

# node
sudo apt-get install -y npm
sudo npm install -g neovim
sudo npm install prettier --global
sudo npm install markdownlint-cli2 --global
sudo npm install markdown-toc --global
sudo npm install -g @mermaid-js/mermaid-cli

# python
sudo pacman -S --noconfirm python3 python-pip python-virtualenv python-pynvim

# neovim
sudo pacman -S --noconfirm neovim

# git
sudo pacman -S --noconfirm git git-delta lazygit

# docker
sudo pacman -S --noconfirm docker docker-compose lazydocker
