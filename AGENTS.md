# AGENTS.md

Agent ramp-up for dotfiles repo. Every item here is something easy to miss.

## What this repo is

Cross-platform dotfiles (macOS / Ubuntu / Arch). Symlinks from `config/` into `$HOME` and `$XDG_CONFIG_HOME` (`~/.config`). No build system, no test suite (`test.sh` is a placeholder — `echo "Hello World!"`). No CI.

## Setup

```bash
./install_mac.sh     # or install_ubuntu.sh / install_arch.sh
./setup.sh
```

`setup.sh` runs every time to refresh symlinks. Safe to re-run for individual file links (`ln -sf`). Directory links use a `[ ! -L ]` guard — they will NOT be re-created if already present.

## Known bugs in install scripts

- `install_arch.sh` lines 48–49: uses `apt-get` for LaTeX (copy-paste bug). Use `pacman` for any new additions.
- Ubuntu: `nvim` and `lazygit` are NOT installed from apt — GitHub releases only. Paths: `/opt/nvim-linux-x86_64/bin/nvim`. Don't add apt install blocks for these.
- Ubuntu tmux catppuccin clone typo: `captpuccin-tmux` (clone target) vs `catppuccin-tmux` (expected by `tmux.conf run` line). Watch if adding tmux plugin steps.

## Symlink conventions

- Individual dotfiles (`~/.zshrc`, `~/.gitconfig`, etc.): `ln -sf "$PWD/config/..."` — no guard, always overwrites.
- Full XDG directories (`~/.config/nvim`, `~/.config/kitty`, etc.): `[ ! -L "$XDG_CONFIG_HOME"/X ] && ln -sf ...` guard.
- New full-dir configs → `$XDG_CONFIG_HOME`; legacy dotfiles → `$HOME`.
- Always add symlink to `setup.sh` when adding new config.

## Neovim (LazyVim)

Entry: `config/nvim/init.lua` → `config/nvim/lua/config/lazy.lua`

- **Add LazyVim extra**: append to `spec` in `lazy.lua` (`config/nvim/lua/config/lazy.lua:14`)
- **Add custom plugin**: new `.lua` file in `config/nvim/lua/plugins/` — auto-loaded, no registration needed
- **Active colorscheme**: `minimal_high_contrast` (set in `config/nvim/lua/plugins/themes.lua`), NOT catppuccin
- **Formatter**: stylua for Lua (`config/nvim/stylua.toml`), prettier for everything else
- **FZF not Telescope** — Telescope is commented out; use fzf extras
- Unused providers disabled in `options.lua` (node/perl/ruby) to silence `:checkhealth`

## Shell (zsh)

- `config/zsh/zshrc` sourced as `~/.zshrc`
- `config/zsh/ohmyzshrc` sourced at bottom of zshrc — oh-my-zsh plugins active: `tmux git thefuck fzf starship zoxide`
- `eval "$(zoxide init zsh)"` is commented out — zoxide works via oh-my-zsh plugin, not direct init
- `cd` aliased to `z` (zoxide)
- Key aliases: `v=nvim`, `t=tmux`, `cat=bat`/`batcat`, `ls=eza`, `ll=eza -alhg`, `tree=eza --tree`, `lg=lazygit`

## Tokens / secrets

`HOMEASSISTANT_TOKEN` and `HA_TOKEN` are hardcoded in `config/zsh/zshrc:124-125`. Do not add new tokens inline. MCP homeassistant server reads `HA_TOKEN` from environment.

## tmux

- Prefix: `Ctrl+Space`
- Pane nav: `hjkl` (vim-style) + `Alt+arrows`
- Window switch: `Shift+arrows` or `Alt+H/L`
- Reload config: `<prefix> r`
- TPM path: `~/.config/tmux/plugins/tpm`
- Theme: catppuccin mocha

## MCP servers

Config: `config/copilot/mcp-config.json`. Active: filesystem, fetch, git, sequential-thinking, memory, pdf-reader, homeassistant, wireshark-mcp.

## Scripts on PATH (`$SCRIPTS = $DOTFILES/scripts`)

- `push` — interactive add-all/commit/push helper
- `master` — checkout master/main + pull

## Git

- Pull strategy: merge (not rebase) — set in `config/git/.gitconfig`
- Pager: delta with `side-by-side = true`, navigate with `n`/`N`

## Adding new tools

| OS     | Package manager                                         |
| ------ | ------------------------------------------------------- |
| macOS  | Homebrew only                                           |
| Ubuntu | apt for common tools; GitHub releases for nvim, lazygit |
| Arch   | pacman (not apt — see bug above)                        |
