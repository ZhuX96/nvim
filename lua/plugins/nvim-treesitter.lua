local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status then
  print('Failed to require treesitter')
  return
end

treesitter.setup {
  ensure_installed = {'c', 'cpp' },
  ignore_install = { 'lua' },
  auto_install = true,
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  auto_tag = {
    enable = true
  }
}
