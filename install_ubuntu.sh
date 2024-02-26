#!/bin/bash


#
# font
# https://www.nerdfonts.com/font-downloads
#
brew tap homebrew/cask-fonts && brew install --cask font-source-code-pro
brew tap homebrew/cask-fonts && brew install --cask font-sauce-code-pro-nerd-font

#
#
#
brew install starship
brew install alacritty
brew install thefuck fzf

brew install curl wget unzip gzip tar
brew install npm


# tmux
sudo apt-get install tmux

# neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz



brew install git lazygit

brew install lazydocker
