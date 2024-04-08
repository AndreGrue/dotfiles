---
return {

  -- add themes
  { "ellisonleao/gruvbox.nvim" },
  { "navarasu/onedark.nvim" },
  { "wittyjudge/gruvbox-material.nvim" },
  { "dasupradyumna/midnight.nvim", lazy = false, priority = 1000 },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      -- colorscheme = "gruvbox-material",
      -- colorscheme = "onedark",
      -- colorscheme = "midnight",
      -- style = "darker",
    },
  },
}
