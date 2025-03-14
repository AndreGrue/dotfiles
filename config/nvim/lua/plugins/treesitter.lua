return {

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "tmux",
        "comment",
        "diff",
        "dockerfile",
        "c",
        "cpp",
        "cmake",
        "make",
        "python",
        "latex",
        "lua",
        "query",
        "regex",
        "vim",
        "markdown",
        "markdown_inline",
        "yaml",
        "json",
        "json5",
        "jsonc",
        "css",
        "norg",
        "scss",
        "svelte",
        "typst",
        "vue",
      },
    },
  },
}
