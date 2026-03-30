-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Open Neo-tree automatically on startup.
--
-- Why vim.schedule instead of a VimEnter autocmd:
-- This file is sourced during the "VeryLazy" event (after UIEnter), so any
-- VimEnter/UIEnter autocmd registered here would never fire for the current
-- session. vim.schedule defers execution to the next event-loop tick, which
-- is after LazyVim finishes bootstrapping — the right moment to open the tree.
vim.schedule(function()
  -- Only open on bare `nvim` or `nvim .` — skip when a specific file is given.
  local argv = vim.fn.argv() --[[@as string[] ]]
  if #argv > 0 and vim.fn.isdirectory(argv[1]) == 0 then
    return
  end

  -- Skip special buffers: git commit messages, terminals, oil.nvim, etc.
  local bufname = vim.api.nvim_buf_get_name(0)
  if vim.bo.buftype ~= "" or bufname:match("^oil://") then
    return
  end

  -- Open Neo-tree rooted at cwd (not tied to any specific file).
  require("neo-tree.command").execute({ action = "show", dir = vim.uv.cwd() })
end)

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
