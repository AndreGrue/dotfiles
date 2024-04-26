--
--  https://github.com/kevinhwang91/nvim-ufo
--
return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "VeryLazy",
  opts = {
    open_fold_hl_timeout = 150,
    close_fold_kinds_for_ft = {
      default = { "imports", "comment" },
      json = { "array" },
      c = { "comment", "region" },
    },
    preview = {
      -- win_config = {
      -- border = { "", "─", "", "", "", "─", "", "" },
      -- winhighlight = "Normal:Folded",
      -- winblend = 0,
      -- },
      mappings = {
        scrollU = "<C-u>",
        scrollD = "<C-d>",
        jumpTop = "[",
        jumpBot = "]",
      },
    },
  },
  config = function(_, opts)
    --
    --
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 20 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    --
    --
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (" 󰁂 %d "):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, "MoreMsg" })
      return newVirtText
    end
    --
    --
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

    --
    -- global handler
    -- `handler` is the 2nd parameter of `setFoldVirtTextHandler`,
    -- check out `./lua/ufo.lua` and search `setFoldVirtTextHandler` for detail.
    --
    opts["fold_virt_text_handler"] = handler
    ufo.setup(opts)
  end,
}
