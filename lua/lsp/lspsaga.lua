local saga_status, saga = pcall(require, 'lspsaga')
if not saga_status then
  print('Failed to require lspsaga')
  return
end

saga.setup {
  ui = {
    border = 'rounded',
  },
  lightbulb = {
    enable = false,
  },
  outline = {
    win_width = 50,
  }
}


vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>')
vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>')

-- overwrite LspAttach in lua/lsp/init.lua
-- todo: refactor
vim.api.nvim_create_autocmd('LspAttach', {
  -- group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(args)
    local opts = { noremap = true, silent = true, buffer = args.buf}
    vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', opts)
    vim.keymap.set('n', '<space>pd', '<cmd>Lspsaga peek_definition<cr>', opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', '<cmd>Lspsaga code_action<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<cr>', opts)
    vim.keymap.set('n', 'gh', '<cmd>Lspsaga hover_doc<cr>', { silent = true })
  end,
})


-- error lens
vim.fn.sign_define {
  {
    name = 'DiagnosticSignError',
    text = '',
    texthl = 'DiagnosticSignError',
    linehl = 'ErrorLine',
  },
  {
    name = 'DiagnosticSignWarn',
    text = '',
    texthl = 'DiagnosticSignWarn',
    linehl = 'WarningLine',
  },
  {
    name = 'DiagnosticSignInfo',
    text = '',
    texthl = 'DiagnosticSignInfo',
    linehl = 'InfoLine',
  },
  {
    name = 'DiagnosticSignHint',
    text = '',
    texthl = 'DiagnosticSignHint',
    linehl = 'HintLine',
  },
}
