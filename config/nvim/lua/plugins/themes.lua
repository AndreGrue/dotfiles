---
return {

  -- add themes
  { "ellisonleao/gruvbox.nvim" },
  { "navarasu/onedark.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
      -- colorscheme = "onedark",
      -- style = "darker",
    },
  },
}
