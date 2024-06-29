vim.api.nvim_create_autocmd('TextYankPost',{
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 300
    }
  end,
})

vim.g.everforest_diagnostic_line_highlight = 1
-- vim.g.everforest_transparent_background = 2

-- light: everforest
-- vim.g.everforest_background = 'hard'
-- vim.opt.background = "light"

-- medium:  everforest
-- vim.g.everforest_background = 'medium'
-- vim.opt.background = "dark"

-- vim.cmd('colorscheme everforest')

-- light:   catppuccin-latte
-- vim.cmd('colorscheme catppuccin-latte')

-- medium:  catppuccin-macchiato
vim.cmd('colorscheme catppuccin-macchiato')

-- dark: catppuccin-mocha
-- vim.cmd('colorscheme catppuccin-mocha')

