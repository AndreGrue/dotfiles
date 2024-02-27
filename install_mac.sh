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
brew install thefuck

# fzf
brew install fzf fd
$(brew --prefix)/opt/fzf/install

# tmux
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# neovim
brew install curl wget unzip gzip tar
brew install npm
brew install neovim ripgrep

#
brew install git lazygit

#
brew install lazydocker
