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
curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/refs/heads/master/install.sh | sh
# brew install rtk
rtk init -g --opencode
### overwrite until opencode v2 plugin is avalaible
cat >"$HOME/.config/opencode/plugins/rtk.ts" <<"EOF"
// rtk OpenCode plugin (V2)
// Wraps shell commands in `rtk run "..."` so RTK can compress tool output.
//
// OpenCode V2 exposes the tool arguments as `event.input` (mutable). The V1
// name `action.arguments` no longer exists; reading it threw before every
// shell call, which broke the shell tool entirely.
import { Plugin } from "@opencode/plugin";
import { execFileSync } from "node:child_process";

// A non-zero exit still means the binary exists; only ENOENT means missing.
function commandExists(command: string): boolean {
  try {
    execFileSync(command, ["--help"], { stdio: "ignore", timeout: 1000 });
    return true;
  } catch (error) {
    return (error as { code?: string } | undefined)?.code !== "ENOENT";
  }
}

export default Plugin.define({
  id: "rtk",
  async setup(ctx) {
    // Without rtk installed, leave shell commands untouched instead of
    // rewriting them into a command that cannot run.
    if (!commandExists("rtk")) return;

    await ctx.tool.hook("execute.before", (event) => {
      // V2 exposes the shell tool as "shell"; accept legacy "bash" too.
      if (event.tool !== "shell" && event.tool !== "bash") return;

      const input = event.input as { command?: unknown } | undefined;
      if (!input || typeof input.command !== "string" || input.command.length === 0) return;

      input.command = `rtk run "${input.command.replace(/"/g, '\\"')}"`;
    });
  },
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

#  <https://github.com/Fission-AI/OpenSpec>
npm install -g @fission-ai/openspec@latest
