---
return {
  {
    "myakove/homeassistant-nvim",
    dependencies = {
      "neovim/nvim-lspconfig", -- Required for LSP
      "nvim-telescope/telescope.nvim", -- Optional, for entity picker
    },
    event = { "BufRead", "BufNewFile" }, -- Load on file open
    config = function()
      require("homeassistant").setup({
        lsp = {
          enabled = true,
          -- LSP server command (default: homeassistant-lsp --stdio)
          cmd = { "homeassistant-lsp", "--stdio" },
          -- File types to attach LSP to
          filetypes = { "yaml", "yaml.homeassistant", "python", "json" },
          -- LSP server settings
          settings = {
            homeassistant = {
              host = "ws://homeassistant.local:8123/api/websocket",
              token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiIxNTdiZGU1NTFmNmI0NDYxOTRjMTc2MmMzNmNhN2U4YyIsImlhdCI6MTc3MTE1NTQwNSwiZXhwIjoyMDg2NTE1NDA1fQ.t9GhS5zbvqcEF-5okh5ARnDCF0gyjuQJndXqOu1yPMc",
              timeout = 5000,
            },
            cache = {
              enabled = true,
              ttl = 300, -- 5 minutes
            },
            diagnostics = {
              enabled = true,
              debounce = 500,
            },
          },
        },
        -- Optional: UI settings
        ui = {
          dashboard = {
            width = 0.8,
            height = 0.8,
            border = "rounded",
          },
        },
        -- Optional: Custom keymaps (set to false to disable defaults)
        keymaps = {
          dashboard = "<leader>hd",
          picker = "<leader>hp",
          reload_cache = "<leader>hr",
          debug = "<leader>hD",
          edit_dashboard = "<leader>he",
        },
      })
    end,
  },
}
