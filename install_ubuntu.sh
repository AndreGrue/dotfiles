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
sudo apt-get install -y eza bat ripgrep zoxide entr thefuck
sudo apt-get install -y mc ncdu btop htop
sudo apt-get install -y curl wget rsync lynx
sudo apt-get install -y unzip gzip tar
sudo apt-get install -y imagemagick libmagickwand-dev libgraphicsmagick1-dev chafa

# fzf
sudo apt-get purge -y fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# fd
sudo apt-get install -y fd-find
ln -s $(which fdfind) ~/.local/bin/fd

#############################################################################################
# terminal

# starship
curl -sS https://starship.rs/install.sh | sh

# kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
echo 'kitty.desktop' >~/.config/xdg-terminals.list

# zsh
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# tmux
sudo apt-get install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/captpuccin-tmux

# file manager - yazi, see rust
apt install ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick

#############################################################################################
# nvim

# latex
sudo apt-get install texlive-latex-base
sudo apt-get install -y bibtex biber latexmk
pipx install pylatexenc
pipx install jupytext

# lua
sudo apt-get install -y luarocks
sudo luarocks install magick

# rust
sudo apt-get purge -y tree-sitter
sudo apt-get install -y rustup
rustup default stable
rustup update
rustup component add rust-analyzer
cargo install tree-sitter-cli gitlab-ci-ls ast-grep yazi

# node
sudo apt-get install -y npm
sudo npm install -g neovim
sudo npm install prettier --global
sudo npm install markdownlint-cli2 --global
sudo npm install markdown-toc --global
sudo npm install -g @mermaid-js/mermaid-cli

# python
sudo apt-get install -y python3-pip python3-venv python3-neovim

# neovim
#sudo add-apt-repository ppa:neovim-ppa/unstable
#sudo apt-get update
#sudo apt-get install neovim
sudo apt-get purge neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# git
sudo apt-get install -y git git-delta
#sudo add-apt-repository ppa:lazygit-team/release
#sudo apt update
#sudo apt install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

#brew install lazydocker
