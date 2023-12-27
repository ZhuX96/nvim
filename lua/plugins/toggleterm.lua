local toggleterm_status, toggleterm = pcall(require, 'toggleterm')
if not toggleterm_status then
  print('Failed to require toggleterm_status')
  return
end

toggleterm.setup({
  size = function(term)
    if term.direction == "horizontal" then
      return math.floor(vim.api.nvim_win_get_height(0) * 0.3)
    elseif term.direction == "vertical" then
      return math.floor(vim.api.nvim_win_get_width(0) * 0.4)
    end
  end,
  open_mapping = '\\\\f',
  direction = 'float',
  shade_terminals = false,
  start_in_insert = false,
  float_opts = {
    border = 'curved',
    width = math.floor(vim.api.nvim_win_get_width(0) * 0.8),
    height = math.floor(vim.api.nvim_win_get_height(0) * 0.8),
  },
})

-- vim.keymap.set('n', '\\\\f', '<Cmd>exe "ToggleTerm direction=float"<CR>')
-- vim.keymap.set('n', '\\\\t', '<Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>')
-- vim.keymap.set('n', '\\\\v', '<Cmd>exe v:count1 . "ToggleTerm direction=vertical"<CR>')

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.keymap.set('t', 'sh', [[<Cmd>wincmd h<CR>]], opts)
  -- vim.keymap.set('t', 'sj', [[<Cmd>wincmd j<CR>]], opts)
  -- vim.keymap.set('t', 'sk', [[<Cmd>wincmd k<CR>]], opts)
  -- vim.keymap.set('t', 'sl', [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
