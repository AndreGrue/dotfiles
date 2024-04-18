---
return {
  {
    --
    -- See: https://github.com/lewis6991/gitsigns.nvim#usage
    --
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    -- stylua: ignore    
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end)


        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end)

        -- Actions
        map("n", "<leader>h", function () end, { desc = 'GitSigns' })
        map("n", "<leader>hs", gitsigns.stage_hunk, { silent = true, desc = 'Stage hunk' })
        map("n", "<leader>hr", gitsigns.reset_hunk, { silent = true, desc = 'Reset hunk' })
        map("v", "<leader>hs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = 'Stage hunk' })
        map("v", "<leader>hr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = 'Reset hunk' })
        map("n", "<leader>hS", gitsigns.stage_buffer, { silent = true, desc = 'Stage buffer' })
        map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = 'Undo staged hunk' })
        map("n", "<leader>hR", gitsigns.reset_buffer, { desc = 'Reset buffer' })
        map("n", "<leader>hp", gitsigns.preview_hunk, { desc = 'Preview hunk' })
        map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end, { desc = 'Show blame commit' })
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = 'Toggle Git line blame' })
        map("n", "<leader>hd", gitsigns.diffthis, { desc = 'Diff against the index' })
        map("n", "<leader>hD", function() gitsigns.diffthis("~") end, { desc = 'Diff against the last commit' })
        map("n", "<leader>td", gitsigns.toggle_deleted, { desc = 'Toggle Git deleted' })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { silent = true, desc = 'Select hunk'})
      end,
    },
    lazy = false,
  },
}
