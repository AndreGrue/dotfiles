#!/bin/bash

export XDG_CONFIG_HOME="$HOME"/.config

#
# create directories
#
mkdir -p "$XDG_CONFIG_HOME"/alacritty
mkdir -p "$XDG_CONFIG_HOME"/tmux
mkdir -p "$XDG_CONFIG_HOME"/starship

#
# addons
#
[ ! -d "$XDG_CONFIG_HOME"/alacritty/themes ] && git clone https://github.com/alacritty/alacritty-theme "$XDG_CONFIG_HOME"/alacritty/themes

# mc
TMPDIR=/tmp/mc-onedark
[ -d "$TMPDIR" ] && rm -rf "$TMPDIR"
git clone https://github.com/DeadNews/mc-onedark.git ${TMPDIR}
cp -r ${TMPDIR}/skins "$HOME"/.local/share/mc
#cp ${TMPDIR}/config/*ini "$XDG_CONFIG_HOME"/mc/

#
# symbolic links
#
ln -sf "$PWD/config/bash/.bash_profile" "$HOME"/.bash_profile
ln -sf "$PWD/config/bash/.bashrc" "$HOME"/.bashrc
ln -sf "$PWD/config/git/.gitconfig" "$HOME"/.gitconfig
ln -sf "$PWD/config/alacritty/alacritty.toml" "$XDG_CONFIG_HOME"/alacritty/alacritty.toml
ln -sf "$PWD/config/tmux/tmux.conf" "$XDG_CONFIG_HOME"/tmux/tmux.conf
ln -sf "$PWD/config/starship/starship.toml" "$XDG_CONFIG_HOME"/starship.toml
ln -sf "$PWD/config/nvim" "$XDG_CONFIG_HOME"/nvim
ln -sf "$PWD/config/mc" "$XDG_CONFIG_HOME"/mc
