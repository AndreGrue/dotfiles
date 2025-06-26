return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pasls = {
          default_config = {
            cmd = { "pasls" },
            filetypes = { "pascal", "objectpascal" },
            root_dir = require("lspconfig.util").root_pattern(".git", "."),
          },
        },
      },
      setup = {
        pasls = function(_, opts)
          require("lspconfig").pasls.setup(opts)
          return true
        end,
      },
    },
  },
  -- {
  --   "alaviss/nim.nvim", -- basic Pascal-like TS syntax
  --   ft = { "pascal" },
  -- },
}
