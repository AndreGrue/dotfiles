# Agent Instructions

This is a standalone dotfiles repository, not an application.

## Repository Shape

- `config/` contains tool-specific configs
- `install_*.sh` scripts install platform dependencies
- `setup.sh` links configs into `$HOME`.

## Setup

- Use `./install_mac.sh`, `./install_arch.sh`, or `./install_ubuntu.sh` only for the matching OS.
  They install system packages and are not idempotent in every step.
- Run `./setup.sh` from the repository root.
  It uses `$PWD` for source paths, creates selected `$XDG_CONFIG_HOME` directories, and creates symlinks.

## Verification

- No package manifest, CI workflow, test suite, or task runner exists. Do not invent
  `npm test` or similar commands.
- For shell changes, run `bash -n path/to/script.sh`; for the Pascal installer, use
  `bash -n config/pascal/install.sh` as well.
- Markdown uses `config/markdownlint-cli2.yaml` with a 120-column limit. If installed,
  run:

  ```sh
  markdownlint-cli2 --config config/markdownlint-cli2.yaml \
    '**/*.md'
  ```

- Neovim plugin state is bootstrapped by `config/nvim/lua/config/lazy.lua`; first
  startup may clone `lazy.nvim` and install plugins. Keep generated state out of
  commits.

## Change Safety

- Do not commit secrets from shell configuration.
