local preview_status, preview = pcall(require, 'goto-preview')
if not preview_status then
  print('Failed to require goto-preview')
  return
end

preview.setup {

}

vim.keymap.set('n', '<Leader>gpd', preview.goto_preview_definition)
vim.keymap.set('n', '<Leader>gpD', preview.goto_preview_declaration)
vim.keymap.set('n', '<Leader>gpc', preview.close_all_win)
vim.keymap.set('n', '<Leader>gpr', preview.goto_preview_references)

