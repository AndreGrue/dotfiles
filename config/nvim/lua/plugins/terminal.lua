---
-- stylua: ignore
if true then return {} end

---
return {
  ---
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<c-\>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
      direction = "float",
    },
  },
}
