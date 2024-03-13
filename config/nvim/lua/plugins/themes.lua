---
return {

  -- add themes
  { "ellisonleao/gruvbox.nvim" },
  { "navarasu/onedark.nvim" },
  { "wittyjudge/gruvbox-material.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      -- colorscheme = "gruvbox-material",
      colorscheme = "onedark",
      -- style = "darker",
    },
  },
}
