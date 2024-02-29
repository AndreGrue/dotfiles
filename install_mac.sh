#!/bin/bash

#
# bash
#
#cat /etc/shells
#brew install bash
#echo $(brew --prefix)/bin/bash | sudo tee -a /private/etc/shells
#chsh -s $(brew --prefix)/bin/bash

#
# font
# https://www.nerdfonts.com/font-downloads
#
brew tap homebrew/cask-fonts && brew install --cask font-source-code-pro
brew tap homebrew/cask-fonts && brew install --cask font-sauce-code-pro-nerd-font

# terminal
brew install starship
brew install alacritty

# commandline tools
brew install eza bat ripgrep zoxide entr thefuck
brew install mc ncdu btop htop
brew install unzip gzip tar
brew install curl wget rsync

# fzf
brew install fzf fd
$(brew --prefix)/opt/fzf/install

# tmux
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# neovim
brew install npm
brew install neovim

#
brew install git lazygit

#
brew install lazydocker
