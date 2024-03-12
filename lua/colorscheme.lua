vim.api.nvim_create_autocmd('TextYankPost',{
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 300
    }
  end,
})

vim.g.everforest_diagnostic_line_highlight = 1
-- vim.g.everforest_background = 'hard'
vim.g.everforest_transparent_background = 2
vim.cmd('colorscheme everforest')

