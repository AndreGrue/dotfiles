return {
  "nvim-neo-tree/neo-tree.nvim",
  init = function()
    -- Register VimEnter here (inside init) so it fires before neo-tree loads.
    -- autocmds.lua is sourced during VeryLazy — too late to catch VimEnter.
    vim.api.nvim_create_autocmd("VimEnter", {
      once = true,
      callback = function()
        -- Skip when a specific file is given (but allow bare `nvim` or `nvim .`)
        local argv = vim.fn.argv() --[[@as string[] ]]
        if #argv > 0 and vim.fn.isdirectory(argv[1]) == 0 then
          return
        end
        -- Skip special buffers: terminals, oil.nvim, git commit, etc.
        local bufname = vim.api.nvim_buf_get_name(0)
        if vim.bo.buftype ~= "" or bufname:match("^oil://") then
          return
        end
        -- vim.cmd triggers lazy.nvim command handler → loads + shows neo-tree
        vim.cmd("Neotree show")
      end,
    })
  end,
}
