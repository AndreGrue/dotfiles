---
return {
  ---
  {
    "GCBallesteros/NotebookNavigator.nvim",
    -- stylua: ignore
    keys = {
      { "]j", function() require("notebook-navigator").move_cell("d") end, desc = "NotebookNavigator: move cell down"},
      { "[j", function() require("notebook-navigator").move_cell("u") end,  desc = "NotebookNavigator: move cell up"},
      { "<leader>J", "<cmd>lua require('notebook-navigator').run_cell()<cr>", desc = "NotebookNavigator: run cell" },
      { "<leader>j", "<cmd>lua require('notebook-navigator').run_and_move()<cr>", desc = "NotebookNavigator: run and move" },
    },
    dependencies = {
      "echasnovski/mini.comment",
      "hkupty/iron.nvim", -- repl provider
      -- "akinsho/toggleterm.nvim", -- alternative repl provider
      -- "benlubas/molten-nvim", -- alternative repl provider
      "anuvyklack/hydra.nvim",
    },
    event = "VeryLazy",
    config = function()
      local nn = require("notebook-navigator")
      nn.setup({ activate_hydra_keys = "<leader>i" })
    end,
  },
}
