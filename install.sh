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

#
#
#
brew install starship
brew install alacritty

brew install curl wget unzip gzip tar
brew install npm
brew install neovim ripgrep fd

brew install git lazygit

brew install lazydocker
