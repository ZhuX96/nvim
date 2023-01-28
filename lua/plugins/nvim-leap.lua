local nvim_leap_status, nvim_leap = pcall(require, 'leap')
if not nvim_leap_status then
  print('Failed to require leap.nvim')
  return
end

nvim_leap.add_default_mappings()

vim.keymap.set({'n', 'x', 'o'}, 'q', '<Plug>(leap-forward-to)')
vim.keymap.set({'n', 'x', 'o'}, 'Q', '<Plug>(leap-backward-to)')
