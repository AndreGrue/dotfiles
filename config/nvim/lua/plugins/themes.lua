---
return {

  -- add themes
  -- { "ellisonleao/gruvbox.nvim" },
  -- { "navarasu/onedark.nvim" },
  -- { "wittyjudge/gruvbox-material.nvim" },
  { "dasupradyumna/midnight.nvim", lazy = false, priority = 1000 },

  {
    "andregrue/minimal_high_contrast.nvim",
    -- dir = "~/workspace/minimal_high_contrast.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
  },

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
