-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Load Neo-tree plugin and open it on startup
-- vim.api.nvim_create_autocmd("VimEnter", {
--   pattern = "*",
--   command = "Neotree",
-- })

-- Debugging: Automatically open Neo-tree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    print("Opening Neo-tree")
    -- vim.cmd("Neotree")
  end,
})

-- open a terminal always in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.cmd("startinsert")
  end,
})

-- Automatically enter insert mode when entering a terminal buffer
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.cmd("startinsert")
    end
  end,
})
