---
return {

  -- add themes
  { "ellisonleao/gruvbox.nvim" },
  { "navarasu/onedark.nvim" },
  { "wittyjudge/gruvbox-material.nvim" },
  { "dasupradyumna/midnight.nvim", lazy = false, priority = 1000 },

  { "rktjmp/lush.nvim" },
  { "andregrue/minimal_high_contrast.nvim", lazy = false, priority = 1000 },
  -- { dir = "~/workspace/minimal_high_contrast.nvim", lazy = true },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "minimal_high_contrast",
      -- colorscheme = "gruvbox",
      -- colorscheme = "gruvbox-material",
      -- colorscheme = "onedark",
      -- colorscheme = "midnight",
      -- style = "darker",
    },
  },
}
