#!/bin/bash

#
# bash
#
#cat /etc/shells
#brew install bash
#echo $(brew --prefix)/bin/bash | sudo tee -a /private/etc/shells
#chsh -s $(brew --prefix)/bin/bash

#############################################################################################
#
# font
# https://www.nerdfonts.com/font-downloads
#
brew tap homebrew/cask-fonts && brew install --cask font-source-code-pro
brew tap homebrew/cask-fonts && brew install --cask font-sauce-code-pro-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-ubuntu-nerd-ont

#############################################################################################
#
# terminal
#
brew install starship
# kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# alacritty
# brew install alacritty
# curl -sSL https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info | tic -x -
# mkdir -p ~/.bash_completion
# cp /Applications/Alacritty.app/Contents/Resources/completions/alacritty.bash ~/.bash_completion/alacritty
# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# tmux
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#############################################################################################
#
# commandline tools
brew install eza bat ripgrep ast-grep zoxide entr thefuck
brew install mc ranger ncdu
brew install btop htop
brew install unzip gzip tar
brew install curl wget rsync lynx
brew tap natesales/repo https://github.com/natesales/repo
brew install q
brew install xsv jq jc fx sd
brew install imagemagick

## file manager
brew install yazi ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide resvg imagemagick font-symbols-only-nerd-font

# fzf
brew install fzf fd
$(brew --prefix)/opt/fzf/install

# latex
brew install mactex
pipx install pylatexenc
pipx install jupytext

# neovim
brew install luarocks
luarocks install magick
luarocks --local --lua-version=5.1 install magick

brew install npm
npm install -g neovim
npm install -g markdownlint-cli2 markdown-toc prettier

brew install rust
brew install neovim

# git
brew install git git-delta lazygit

#
brew install lazydocker
