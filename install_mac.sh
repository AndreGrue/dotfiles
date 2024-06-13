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
brew tap homebrew/cask-fonts && brew install --cask font-ubuntu-nerd-ont

# terminal
brew install starship
brew install alacritty
curl -sSL https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info | tic -x -
mkdir -p ~/.bash_completion
cp /Applications/Alacritty.app/Contents/Resources/completions/alacritty.bash ~/.bash_completion/alacritty

# commandline tools
brew install eza bat ripgrep zoxide entr thefuck
brew install mc ranger ncdu
brew install btop htop
brew install unzip gzip tar
brew install curl wget rsync
brew tap natesales/repo https://github.com/natesales/repo
brew install q
brew install xsv jq jc fx sd
brew install imagemagick

# fzf
brew install fzf fd
$(brew --prefix)/opt/fzf/install

# tmux
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# latex
brew install mactex
# neovim
brew install luarocks
luarocks install magick

brew install npm
npm install -g neovim

brew install rust
brew install neovim

# git
brew install git git-delta lazygit

#
brew install lazydocker
