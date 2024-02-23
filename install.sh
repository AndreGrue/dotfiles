#!/bin/bash


#
# bash
#
cat /etc/shells
brew install bash
echo $(brew --prefix)/bin/bash | sudo tee -a /private/etc/shells
chsh -s $(brew --prefix)/bin/bash

#
# font
#
brew tap homebrew/cask-fonts && brew install --cask font-source-code-pro

#
#
#
brew install --cask alacritty
brew install neovim go lazygit 



