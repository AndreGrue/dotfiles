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
        "html",
        "javascript",
        "lua",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "markdown",
        "markdown_inline",
        "yaml",
        "json",
      },
    },
  },
}
