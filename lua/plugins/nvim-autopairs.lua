local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
  print('Failed to require autopairs')
  return
end

autopairs.setup {
  check_ts = true,
  disable_filetype = { "TelescopePrompt" , "vim" },
}
