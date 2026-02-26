return {
  -- add catppuccin
  { "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = {
    flavour = "mocha",
  } },

  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
