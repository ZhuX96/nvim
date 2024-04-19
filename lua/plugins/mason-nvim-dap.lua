-- AFTER require('mason').setup
-- see docs

local mason_nvim_dap_status, mason_nvim_dap = pcall(require, 'mason-nvim-dap')
if not mason_nvim_dap_status then
  print('Failed to require mason-nvim-dap')
  return
end

mason_nvim_dap.setup {

}

