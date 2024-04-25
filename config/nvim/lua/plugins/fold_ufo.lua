--
--  https://github.com/kevinhwang91/nvim-ufo
--
return {
  "kevinhwang91/nvim-ufo",
  event = "VeryLazy",
  config = function()
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 20 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    local ufo = require("ufo")
    -- Remap the builtin keymaps for keeping the foldlevel
    vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
    vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })
    vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds, { desc = "Fold less" })
    vim.keymap.set("n", "zm", ufo.closeFoldsWith, { desc = "Fold more" })
    vim.keymap.set("n", "zK", function()
      local winid = ufo.peekFoldedLinesUnderCursor()
      if winid then
        local bufnr = vim.api.nvim_win_get_buf(winid)
        local keys = { "a", "i", "o", "A", "I", "O", "c", "s" }
        for _, k in ipairs(keys) do
          vim.keymap.set(
            "n",
            k,
            "<CR>" .. k,
            { remap = true, buffer = bufnr, nowait = true }
          )
        end
      else
        vim.lsp.buf.hover()
      end
    end, { desc = "Show Fold preview" })

    --
    --
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
    for _, ls in ipairs(language_servers) do
      require("lspconfig")[ls].setup({
        capabilities = capabilities,
        -- you can add other fields for setting up lsp server in this table
      })
    end
    require("ufo").setup()
  end,
  dependencies = { "kevinhwang91/promise-async" },
}
