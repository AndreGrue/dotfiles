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
    opts = {
      formatters = {
        pascal_format = {
          command = "sh",
          args = {
            "-c",
            "pascal-format -config="
              .. vim.fn.expand("~/workspace/dotfiles/config/pascal/pascal-format.cfg")
              .. ' "$1" && sed -i "1s/^\\xEF\\xBB\\xBF//" "$1"',
            "--",
            "$FILENAME",
          },
          stdin = false,
        },
      },
      formatters_by_ft = {
        pascal = { "pascal_format" },
        objectpascal = { "pascal_format" },
      },
    },
  },
  -- Fix J (join) stripping { comment openers
  {
    "folke/lazy.nvim",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "pascal", "objectpascal" },
        callback = function()
          vim.bo.comments = "://,s:(*,m: ,e:*)"
        end,
      })
    end,
  },
  -- {
  --   "alaviss/nim.nvim", -- basic Pascal-like TS syntax
  --   ft = { "pascal" },
  -- },
}
