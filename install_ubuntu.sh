#!/bin/bash

#
# font
# https://www.nerdfonts.com/font-downloads
#
#brew tap homebrew/cask-fonts && brew install --cask font-source-code-pro
#brew tap homebrew/cask-fonts && brew install --cask font-sauce-code-pro-nerd-font

# common
sudo apt install curl wget unzip gzip tar
sudo apt install thefuck

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# fd
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd

# starship
curl -sS https://starship.rs/install.sh | sh

# alacritty
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty

# tmux
sudo apt-get install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# neovim
#brew install npm
#curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
#sudo rm -rf /opt/nvim
#sudo tar -C /opt -xzf nvim-linux64.tar.gz

#brew install git lazygit

#brew install lazydocker
