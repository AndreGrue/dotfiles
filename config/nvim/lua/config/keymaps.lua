-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- use `vim.keymap.set` instead
local map = vim.keymap.set

--
--
--
map("i", "jj", "<ESC>", { noremap = true, desc = "Leave insert mode" })

--
-- Buffer Mappings
--
-- map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
-- map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- map("n", "<C-x>", "<cmd>bd<cr>", { desc = "Delete Buffer" })



-- stylua: ignore
map("n", "<leader>t", "<cmd>terminal<cr>", { desc = "Open terminal" })

-- floating terminal
-- local lazyterm = function() LazyVim.terminal(nil, { cwd = LazyVim.root() }) end
-- map("n", "<leader>ft", lazyterm, { desc = "Terminal (Root Dir)" })
-- map("n", "<leader>fT", function() LazyVim.terminal() end, { desc = "Terminal (cwd)" })
-- map("n", "<c-/>", function() LazyVim.terminal() end, { desc = "Terminal (Root Dir)" })
-- map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-----------------------------------------------------------------------------------
--
-- build scripts
--

--
-- Function to send commands to the terminal or open a new one if none is found
--
local function send_command_to_terminal(cmd)
  -- Iterate over all buffers to find a terminal buffer
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
      -- Send the command to the terminal buffer
      vim.fn.chansend(vim.api.nvim_buf_get_var(buf, "terminal_job_id"), cmd .. "\n")
      return
    end
  end

  -- If no terminal buffer is found, open a new terminal and run the command
  -- vim.cmd("split term://" .. cmd)
  vim.cmd("split")
  vim.cmd("term")
  vim.cmd("resize 10")
  send_command_to_terminal(cmd)
end

map("n", "<leader>m", "", { noremap = true, silent = true, desc = "make" })
-- stylua: ignore
map("n", "<leader>mc", function() send_command_to_terminal("cmake . && cmake --build .") end, { noremap = true, silent = true, desc = "cmake" })
-- stylua: ignore
map("n", "<leader>mn", function() send_command_to_terminal("/bin/bash ./test.sh") end, { noremap = true, silent = true, desc = "run test" })
