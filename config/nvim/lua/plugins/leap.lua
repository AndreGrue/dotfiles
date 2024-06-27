---
-- stylua: ignore
if true then return {} end
---
return {
  ---
  {
    "ggandor/leap.nvim",
    event = "BufEnter",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
}
