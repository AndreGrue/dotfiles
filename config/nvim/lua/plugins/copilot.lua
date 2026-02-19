---
return {
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = { enabled = true },
  --       panel = { enabled = true },
  --     })
  --   end,
  -- },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
      model = "claude-haiuki-4.5", -- AI model to use
      auto_insert_mode = true,
      auto_follow_cursor = true,
      auto_fold = true,
      clear_chat_on_new_prompt = false,
      show_help = true,
      header_separator = "━━",
      separator = "──",
      error_header = "❌ Error",
      prompts = {
        Explain = "/COPILOT_EXPLAIN Explain the selected code.",
        Review = "/COPILOT_REVIEW Review the selected code.",
        Fix = "/COPILOT_FIX There is a bug in this code. Fix it!",
        Optimize = "/COPILOT_OPTIMIZE Optimize the selected code.",
        Docs = "/COPILOT_DOCS Please add documentation comment for the selected code.",
        Tests = "/COPILOT_TESTS Please generate tests for the selected code.",
        FixDiagnostic = "/COPILOT_FIXDIAGNOSTIC Please fix the diagnostic issue in this line.",
        Commit = "/COPILOT_COMMIT Write a conventional commit message for the changes.",
      },
      chat_autocomplete = true,
      display_selection_by_indent = true,
      selection_start_marker = "```",
      selection_end_marker = "```",
      message_author_role = "User",
      contexts = {
        buffer = true,
        bufnr = true,
        file = true,
        files = true,
      },
      messages = {
        user = "👤 You",
        assistant = "🤖 Copilot",
        tool = "🔧 Tool",
      },
      window = {
        width = 0.4,
      },
    },
    keys = {
      { "<leader>z", "", desc = "+ai", mode = { "n", "x" } },
      -- { "<leader>zq", "<cmd>CopilotChatQuick<cr>", desc = "Quick chat" },
      {
        "<leader>zq",
        function()
          vim.ui.input({
            prompt = "🤖 Quick Chat: ",
          }, function(input)
            if input ~= "" then
              require("CopilotChat").ask(input)
            end
          end)
        end,
        desc = "Quick Chat (CopilotChat)",
        mode = { "n", "x" },
      },
      { "<leader>zc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle chat" },
      { "<leader>zx", "<cmd>CopilotChatReset<cr>", desc = "Toggle chat" },
      { "<leader>ze", "<cmd>CopilotChatExplain<cr>", desc = "Explain code", mode = "v" },
      { "<leader>zr", "<cmd>CopilotChatReview<cr>", desc = "Review code", mode = "v" },
      { "<leader>zf", "<cmd>CopilotChatFix<cr>", desc = "Fix code", mode = "v" },
      { "<leader>zd", "<cmd>CopilotChatDocs<cr>", desc = "Generate docs", mode = "v" },
      { "<leader>zt", "<cmd>CopilotChatTests<cr>", desc = "Generate tests", mode = "v" },
      { "<leader>z/", "<cmd>CopilotChatModels<cr>", desc = "Select model" },
      { "<leader>zm", "<cmd>CopilotChatCommit<cr>", desc = "Generate commit message" },
      { "<leader>zs", "<cmd>CopilotChatCommit<cr>", desc = "Generate commit message for selection", mode = "v" },
    },
  },
}
