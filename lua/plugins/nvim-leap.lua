local nvim_leap_status, nvim_leap = pcall(require, 'leap')
if not nvim_leap_status then
  print('Failed to require leap.nvim')
  return
end

nvim_leap.add_default_mappings()
nvim_leap.opts.safe_labels = {}

vim.keymap.set({'n', 'x', 'o'}, 'm', '<Plug>(leap-forward-to)')
vim.keymap.set({'n', 'x', 'o'}, 'M', '<Plug>(leap-backward-to)')
