# Copilot Instructions

## Repository Purpose

Cross-platform dotfiles for macOS, Ubuntu, and Arch Linux. Manages a complete developer environment via symlinks from `config/` into `$HOME` and `$XDG_CONFIG_HOME` (`~/.config`).

## Setup Commands

```bash
# 1. Install dependencies (pick one)
./install_mac.sh
./install_ubuntu.sh
./install_arch.sh

# 2. Create symlinks
./setup.sh
```

There is no real test suite — `test.sh` is a placeholder.

## Architecture

### Symlink Strategy

`setup.sh` symlinks files and directories from `config/` into the home directory. Some entries link individual files (e.g., `config/zsh/zshrc` → `~/.zshrc`), others link entire directories (e.g., `config/nvim` → `~/.config/nvim`). Guard pattern used to avoid overwriting existing symlinks:

```bash
[ ! -L "$XDG_CONFIG_HOME"/nvim ] && ln -sf "$PWD/config/nvim" "$XDG_CONFIG_HOME"/
```

When adding a new config, add the corresponding symlink to `setup.sh`. New full-directory configs go under `$XDG_CONFIG_HOME`; legacy dotfiles (`.zshrc`, `.gitconfig`, etc.) go directly in `$HOME`.

### Neovim / LazyVim

Neovim is configured with the [LazyVim](https://www.lazyvim.org/) distribution. Entry point: `config/nvim/init.lua` → `config/nvim/lua/config/lazy.lua`.

- **Add a LazyVim extra**: add to the `opts.spec` import list in `lazy.lua`
- **Add a custom plugin**: create a new file in `config/nvim/lua/plugins/`; the plugin spec is auto-loaded
- Lua formatting is configured in `config/nvim/stylua.toml`

Installed extras include: Python, Rust, C/Clang, CMake, Docker, Markdown, LaTeX, JSON/YAML, GitHub Copilot + CopilotChat, FZF (not Telescope), Prettier, Harpoon2.

### Shell (zsh)

- `config/zsh/zshrc` — aliases, functions, environment variables
- `config/zsh/zprofile` — macOS-specific PATH setup
- `config/zsh/ohmyzshrc` — Oh My Zsh plugins

Key env vars set in `zshrc`:
- `DOTFILES=$HOME/workspace/dotfiles`
- `SCRIPTS=$DOTFILES/scripts` (on PATH)
- `EDITOR=nvim`
- `XDG_CONFIG_HOME=$HOME/.config`

Standard aliases in use: `v=nvim`, `t=tmux`, `cat=bat`, `ls=eza`, `ll=eza -alhg`, `tree=eza --tree`, `cd=z` (zoxide), `lg=lazygit`.

### OS-Specific Conventions

- `install_ubuntu.sh` installs several tools from GitHub releases (Neovim, LazGit) rather than apt, due to outdated distro packages. Check for manual install blocks when adding new tools.
- `install_arch.sh` uses `pacman --noconfirm`. Note: currently contains stray `apt-get` calls (copy-paste bug) — use `pacman` for any new additions.
- Homebrew is macOS-only; use it for `install_mac.sh` additions.

### Git Configuration

- Delta is configured as the pager with `side-by-side = true` and `navigate = true` (`n`/`N` to jump sections).
- Pull strategy: merge (not rebase).
- `scripts/push` — interactive add-all/commit/push helper; `scripts/master` — checks out `master`/`main` and pulls.

### tmux

Prefix is `Ctrl+Space`. Plugins managed by TPM (`~/.tmux/plugins/tpm`). Sessions auto-saved every 15 minutes via `tmux-continuum` and restored on boot. Pane navigation uses vim-style `hjkl` and integrates with `vim-tmux-navigator` for seamless editor↔pane switching.

### MCP Servers

MCP server config lives in `config/copilot/mcp-config.json`. Currently configured: `filesystem`, `fetch`, `git`, `sequential-thinking`, `memory`, `pdf-reader`, `homeassistant`.

## Key Conventions

- All configs are under `config/<app>/` — never place config files at the repo root.
- Scripts in `scripts/` are plain bash with no extension and land on `$PATH` via `$SCRIPTS`.
- Platform-specific installer scripts are named `install_<os>.sh`.
- Catppuccin (mocha flavor) is the color theme used across tmux, yazi, and Neovim.
- `HA_TOKEN` / `HOMEASSISTANT_TOKEN` are read from environment — do not hardcode tokens in config files.
