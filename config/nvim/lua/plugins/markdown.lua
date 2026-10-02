return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    keys = {
      {
        "<leader>mt",
        function()
          local buf = vim.api.nvim_get_current_buf()
          local parser = vim.treesitter.get_parser(buf, "markdown")
          if not parser then
            vim.notify("markdown treesitter parser not available", vim.log.levels.WARN)
            return
          end

          local row, col = unpack(vim.api.nvim_win_get_cursor(0))
          local root = parser:parse()[1]:root()
          local node = root:named_descendant_for_range(row - 1, col, row - 1, col)
          if not node or node:type() ~= "html_block" then
            vim.notify("Cursor is not inside an HTML block", vim.log.levels.INFO)
            return
          end

          if vim.fn.executable("tidy") ~= 1 then
            vim.notify("tidy not found (install tidy-html5) for HTML table formatting", vim.log.levels.WARN)
            return
          end

          local sr, sc, er, ec = node:range()
          local text = table.concat(vim.api.nvim_buf_get_text(buf, sr, sc, er, ec, {}), "\n")
          local out = vim.fn.system({ "tidy", "--indent", "yes", "--wrap", "0" }, text)

          local lines
          local inner = out:match("\n%s*<body>\n(.-)\n%s*</body>")
          if inner then
            lines = vim.split(inner, "\n", { plain = true })
          else
            lines = vim.split(out, "\n", { plain = true })
            local first_tag
            for i, l in ipairs(lines) do
              if l:find("%S") and not l:find("^line%d+") and not l:find("^Info:") and not l:find("^%d+ warnings") then
                first_tag = i
                break
              end
            end
            if not first_tag then
              vim.notify("tidy produced no usable output", vim.log.levels.ERROR)
              return
            end
            local last_tag
            for i = #lines, 1, -1 do
              if lines[i]:find("%S") then
                last_tag = i
                break
              end
            end
            local slice = {}
            for i = first_tag, last_tag do
              slice[#slice + 1] = lines[i]
            end
            lines = slice
          end

          local min_col = math.huge
          for _, l in ipairs(lines) do
            local first = l:find("%S")
            if first then
              min_col = math.min(min_col, first)
            end
          end
          if min_col ~= math.huge then
            local prefix = min_col - 1
            if prefix > 0 then
              for i, l in ipairs(lines) do
                lines[i] = l:sub(prefix + 1)
              end
            end
          end

          local formatted = table.concat(lines, "\n"):gsub("\n%s*$", "")
          if vim.trim(formatted) == "" then
            vim.notify("tidy produced no usable output", vim.log.levels.ERROR)
            return
          end

          local ok, err = pcall(function()
            if sc > 0 then
              error("block is not whole-line; move cursor to the start of <table>")
            end
            vim.api.nvim_buf_set_lines(buf, sr, er, false, vim.split(formatted, "\n", { plain = true }))
          end)
          if not ok then
            vim.notify("Failed to replace HTML block: " .. err, vim.log.levels.ERROR)
            return
          end

          local line_count = vim.api.nvim_buf_line_count(buf)
          vim.api.nvim_win_set_cursor(0, { math.min(row, line_count), 0 })
        end,
        desc = "Tidy HTML table",
      },
    },
  },
}