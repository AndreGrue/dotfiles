#!/bin/bash
set -euo pipefail

#############################################################################################
# shell

#cat /etc/shells
#brew install bash
#echo $(brew --prefix)/bin/bash | sudo tee -a /private/etc/shells
#chsh -s $(brew --prefix)/bin/bash

#############################################################################################
# font
# https://www.nerdfonts.com/font-downloads
#
brew install --cask font-source-code-pro
brew install --cask font-sauce-code-pro-nerd-font
brew install --cask font-ubuntu-nerd-font

#############################################################################################
# terminal

# kitty
curl -fsSL https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# zsh
[ -d "$HOME/.oh-my-zsh" ] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# tmux
brew install tmux
mkdir -p "$HOME/.config/tmux/plugins"
[ -d "$HOME/.config/tmux/plugins/tpm" ] || git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
[ -d "$HOME/.config/tmux/plugins/catppuccin-tmux" ] || git clone -b v2.1.3 https://github.com/catppuccin/tmux.git "$HOME/.config/tmux/plugins/catppuccin-tmux"

# herdr
brew install herdr

# tuios
brew install tuios

# starship
brew install starship

#############################################################################################
# commandline tools
brew install eza bat ripgrep ast-grep zoxide entr thefuck
brew install ranger ncdu
brew install btop htop
brew install unzip gzip
brew install curl wget rsync lynx
brew tap natesales/repo https://github.com/natesales/repo
brew install natesales/repo/q
brew install xsv jq jc fx sd
brew install imagemagick

#############################################################################################
# file manager

# mc
brew install mc
TMPDIR=/tmp/mc-onedark
[ -d "$TMPDIR" ] && rm -rf "$TMPDIR"
git clone https://github.com/DeadNews/mc-onedark.git "$TMPDIR"
mkdir -p "$HOME/.local/share/mc"
cp -r "$TMPDIR/skins" "$HOME/.local/share/mc"

# yazi
brew install yazi ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide resvg imagemagick font-symbols-only-nerd-font
[ -d "$HOME/.config/yazi/flavors/flexoki-dark.yazi" ] || ya pkg add gosxrgxx/flexoki-dark

# superfile
brew install superfile

#############################################################################################
# nvim

# fzf
brew install fzf fd
$(brew --prefix)/opt/fzf/install

# latex
brew list --cask mactex >/dev/null 2>&1 || brew install --cask mactex
pipx install pylatexenc
pipx install jupytext

# lua
brew install luarocks
luarocks --local --lua-dir="$(brew --prefix luajit)" install magick

# npm
brew install npm
npm install --global neovim
npm install --global prettier
npm install --global markdownlint-cli2
npm install --global markdown-toc
npm install --global @mermaid-js/mermaid-cli

# rust
brew install rustup
rustup default stable
rustup update
rustup component add rust-analyzer
cargo install tree-sitter-cli gitlab-ci-ls ast-grep

#
brew install neovim

#############################################################################################
# git
brew install git git-delta lazygit

#############################################################################################
# docker
brew install lazydocker

#############################################################################################
# ai

#npm install -g opencode-ai
# curl -fsSL https://opencode.ai/install | bash
curl -fsSL https://opencode.ai/v2/install | bash

#  https://github.com/Tarquinen/opencode-vim
opencode plugin add opencode-vim@latest

#  https://github.com/alvinunreal/oh-my-opencode-slim
bunx oh-my-opencode-slim@latest install --no-tui --background-subagents=yes --preset=opencode-go

#  https://github.com/juliusbrussee/caveman
npm install -g @caveman-ai/cli
caveman setup --install

#  https://github.com/rtk-ai/rtk
brew install rtk
rtk init -g --opencode
### overwrite until opencode v2 plugin is avalaible
cat >"$HOME/.config/opencode/plugins/rtk.ts" <<"EOF"
import { Plugin } from "@opencode/plugin";
import { spawn } from "child_process";

export default Plugin.define({
  id: "rtk",
  async setup(ctx) {
    ctx.tool.hook("execute.before", async (action) => {
      // Intercept bash/shell tool executions
      if (action.tool === "shell" || action.tool === "bash") {
        const originalCmd = action.arguments.command;
        
        // Pass the command through RTK for output compression
        action.arguments.command = `rtk run "${originalCmd.replace(/"/g, '\\"')}"`;
      }
    });
  }
});
EOF

#  https://github.com/manojmallick/sigmap
npm install -g sigmap
sigmap --adapter copilot

#  https://github.com/Tarquinen/opencode-dynamic-context-pruning
# opencode plugin @tarquinen/opencode-dcp@latest --global
opencode plugin add @tarquinen/opencode-dcp@latest

cat >"$HOME/.config/opencode/dcp.jsonc" <<"EOF"
{
  "$schema": "https://raw.githubusercontent.com/Opencode-DCP/opencode-dynamic-context-pruning/master/dcp.schema.json",
  "enabled": true,
  "autoUpdate": true,
  "experimental": {
    "allowSubAgents": true,
  },
  "compress": {
    "maxContextLimit": "70%",
    "minContextLimit": "30%",
  },
}
EOF

#  https://github.com/getagentseal/codeburn
npm install -g codeburn

#  https://github.com/Graphify-Labs/graphify
uv tool install "graphifyy[leiden,pdf,mcp,pascal]"
graphify opencode install # add to project
graphify hook install     # git hook

#  <https://github.com/Fission-AI/OpenSpec>
npm install -g @fission-ai/openspec@latest
