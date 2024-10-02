-- sstylua: ignore
-- if true then return {} end

return {
  {
    "jbyuki/nabla.nvim",
    -- config = function()
    -- Enable virt text automatically for LaTeX and Markdown files
    -- vim.api.nvim_create_autocmd({ "FileType" }, {
    --   pattern = { "tex", "markdown" },
    --   callback = function()
    --     require("nabla").enable_virt({
    --       autogen = true, -- auto-regenerate ASCII art when exiting insert mode
    --       silent = true, -- silents error messages
    --     })
    --   end,
    -- })
    -- end,
    config = function()
      -- Enable virtual text on startup
      -- require("nabla").enable_virt({
        -- autogen = true, -- auto-regenerate ASCII art when exiting insert mode
        -- silent = true, -- silents error messages
      -- })

      -- Auto-enable virt text in normal mode
      -- vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter", "WinEnter" }, {
      --   callback = function()
      --     require("nabla").enable_virt({
      --       autogen = true, -- auto-regenerate ASCII art when exiting insert mode
      --       silent = true, -- silents error messages
      --     })
      --   end,
      -- })

      -- Optional: Toggle virt with key binding if needed
      -- stylua: ignore
      vim.api.nvim_set_keymap("n", "<leader>nv", ':lua require("nabla").toggle_virt()<CR>', { noremap = true, silent = true })
      -- stylua: ignore
      vim.api.nvim_set_keymap("n", "<leader>ne", ':lua require("nabla").enable_virt()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>np", ':lua require("nabla").popup()<CR>', { noremap = true, silent = true })
    end,
  },
}
