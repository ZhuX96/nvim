vim.api.nvim_create_autocmd('TextYankPost',{
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 300
    }
  end,
})

vim.g.everforest_diagnostic_line_highlight = 1
vim.g.everforest_background = 'hard'
vim.cmd('colorscheme everforest')

