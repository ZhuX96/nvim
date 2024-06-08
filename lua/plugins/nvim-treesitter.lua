local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status then
  print('Failed to require treesitter')
  return
end

treesitter.setup {
  ensure_installed = {'c', 'cpp', 'lua', 'go' },
  auto_install = true,
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  auto_tag = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      scope_incremental = false,
      node_decremental = '<bs>',
    },
  },
}
