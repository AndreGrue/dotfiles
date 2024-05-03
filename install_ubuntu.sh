#!/bin/bash

#
# font
# https://www.nerdfonts.com/font-downloads
#
FONTPKG=SauceCodePro.zip
FONTPATH=https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.0
wget -P ~/.local/share/fonts $FONTPATH/$FONTPKG &&
	cd ~/.local/share/fonts &&
	unzip $FONTPKG &&
	rm $FONTPKG &&
	fc-cache -fv

# common
sudo apt install exa bat ripgrep zoxide entr thefuck
sudo apt install mc ncdu btop htop
sudo apt install curl wget rsync
sudo apt install unzip gzip tar

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
#sudo add-apt-repository ppa:neovim-ppa/unstable
#sudo apt-get update
#sudo apt-get install neovim
sudo apt-get install cargo chafa imagemagick
cargo install tree-sitter
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# git
#sudo add-apt-repository ppa:lazygit-team/release
#sudo apt update
#sudo apt install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
sudo apt install git

#brew install lazydocker
