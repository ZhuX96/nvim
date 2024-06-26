vim.g.mapleader = ' '

-- Basic mapping
-- -- disable s
vim.keymap.set('n', 's', '<Nop>')
vim.keymap.set('n', 'q', '<Nop>')

-- -- quit
vim.keymap.set('n', '<Leader>q', '<Cmd>q<CR>')

-- -- save
vim.keymap.set('n', '<Leader>w', '<Cmd>w<CR>')

-- Command line
-- -- move cursor
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')
vim.keymap.set('c', '<C-p>', '<Up>')
vim.keymap.set('c', '<C-n>', '<Down>')
vim.keymap.set('c', '<C-b>', '<Left>')
vim.keymap.set('c', '<C-f>', '<Right>')

-- Window
-- -- split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
vim.keymap.set('n', 'sk', '<Cmd>set nosplitbelow<CR><Cmd>split<CR><Cmd> set splitbelow<CR>')
vim.keymap.set('n', 'sj', '<Cmd>set splitbelow<CR><Cmd>split<CR>')
vim.keymap.set('n', 'sh', '<Cmd>set nosplitright<CR><Cmd>vsplit<CR><Cmd> set splitright<CR>')
vim.keymap.set('n', 'sl', '<Cmd>set splitright<CR><Cmd>vsplit<CR>')
vim.keymap.set('n', 'sH', '<C-w>t<C-w>K')
vim.keymap.set('n', 'sV', '<C-w>t<C-w>H')

-- -- move cursor
vim.keymap.set('n', '<Leader>s', '<C-w>w')
vim.keymap.set('n', '<Leader>h', '<C-w>h')
vim.keymap.set('n', '<Leader>j', '<C-w>j')
vim.keymap.set('n', '<Leader>k', '<C-w>k')
vim.keymap.set('n', '<Leader>l', '<C-w>l')


-- Tab
-- -- create a new tab
vim.keymap.set('n', 'tk', '<Cmd>tabe<CR>')
vim.keymap.set('n', 'tK', '<Cmd>tab split<CR>')

-- -- move around tabs
vim.keymap.set('n', 'th', '<Cmd>-tabnext<CR>')
vim.keymap.set('n', 'tl', '<Cmd>+tabnext<CR>')

-- -- move a tab
vim.keymap.set('n', 'tmh', '<Cmd>-tabmove<CR>')
vim.keymap.set('n', 'tml', '<Cmd>+tabmove<CR>')

-- Other
-- -- terminal
vim.keymap.set('n', '\\\\t', '<Cmd>set splitbelow<CR><Cmd>split<CR><Cmd>res -20<CR><Cmd>term<CR>')
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')

-- lsp config keymaps
-- dap config keymaps
