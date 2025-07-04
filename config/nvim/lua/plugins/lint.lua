-- stylua: ignore
if true then return {} end

-- ~/.config/nvim/lua/plugins/lint.lua
local HOME = os.getenv("HOME")
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        markdownlint = {
          args = { "--disable", "MD012", "MD022", "MD034", "--" },
          -- args = { "--disable", "MD013", "--" },
        },
        ["markdownlint-cli2"] = {
          args = { "--config", HOME .. "/.markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
}
