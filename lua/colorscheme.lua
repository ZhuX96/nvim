vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd('TextYankPost',{
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 300
    }
  end,
})

local status, _ = pcall(vim.cmd, 'colorscheme everforest')
if not status then
  print('Failed to set up colorscheme')
  return
end

local feline_status, feline = pcall(require, 'feline')
if not feline_status then
  print('Failed to require feline')
  return
end

feline.setup()
