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
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      -- Register custom formatter
      opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, {
        ptop = {
          command = "ptop",
          args = { "-c", "~/workspace/dotfiles/config/pascal/ptop.cfg", "$FILENAME", "$FILENAME" },
          stdin = false,
          condition = function(ctx)
            return vim.fn.executable("ptop") == 1
          end,
        },
      })

      -- Assign it to Pascal files
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
        pascal = { "ptop" },
      })
    end,
  },
  -- {
  --   "alaviss/nim.nvim", -- basic Pascal-like TS syntax
  --   ft = { "pascal" },
  -- },
}
