vim.opt.number = true
vim.opt.relativenumber = true

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.mouse = "a"
-- vim.opt.clipboard:append ("unnamedplus")

-- ftplugin or autocmd
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.autoread = true
vim.bo.autoread = true

vim.opt.list = true
vim.opt.pumheight = 10

vim.opt.cursorline = true
vim.opt.termguicolors = true

-- hide ~ and ruler in first page
vim.wo.fillchars='eob: '
vim.opt.ruler = false
