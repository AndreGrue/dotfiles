#!/bin/bash

export XDG_CONFIG_HOME="$HOME"/.config


# create directories
mkdir -p "$XDG_CONFIG_HOME"/bash
mkdir -p "$XDG_CONFIG_HOME"/alacritty
mkdir -p "$XDG_CONFIG_HOME"/tmux
mkdir -p "$XDG_CONFIG_HOME"/starship


# addons
[ ! -d "$XDG_CONFIG_HOME"/alacritty/themes ] && git clone https://github.com/alacritty/alacritty-theme "$XDG_CONFIG_HOME"/alacritty/themes


# symbolic links
ln -sf "$PWD/config/bash/.bash_profile" "$HOME"/.bash_profile
ln -sf "$PWD/config/bash/.bashrc" "$HOME"/.bashrc
ln -sf "$PWD/config/alacritty/alacritty.toml" "$XDG_CONFIG_HOME"/alacritty/alacritty.toml
ln -sf "$PWD/config/tmux/tmux.conf" "$XDG_CONFIG_HOME"/tmux/tmux.conf
ln -sf "$PWD/config/starship/starship.toml" "$XDG_CONFIG_HOME"/starship.toml

