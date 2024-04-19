local dap_go_setup, dap_go = pcall(require, 'dap-go')
if not dap_go_setup then
  print('Failed to require nvim-dap-go')
  return
end

dap_go.setup {

}
