-- ~/.config/nvim/lua/plugins/lint.lua
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        markdownlint = {
          args = { "--disable", "MD012", "MD022", "MD034", "--" },
        },
      },
    },
  },
}
