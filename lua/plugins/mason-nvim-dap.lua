-- AFTER require('mason').setup
-- see docs

local dap_status, dap = pcall(require, 'dap')
if not dap_status then
  print('Failed to require nvim-dap')
end

-- sharing launch.json with vscode
--[[ local dap_ext_vscode_status, dap_ext_vscode = pcall(require, 'dap.ext.vscode')
if not dap_ext_vscode_status then
  print('Failed to require nvim-dap vscode ext')
end

dap.adapters.go = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

dap_ext_vscode.load_launchjs() ]]

local mason_nvim_dap_status, mason_nvim_dap = pcall(require, 'mason-nvim-dap')
if not mason_nvim_dap_status then
  print('Failed to require mason-nvim-dap')
  return
end

mason_nvim_dap.setup {

}

local nvim_dap_text_status, nvim_dap_text = pcall(require, 'nvim-dap-virtual-text')
if not nvim_dap_text_status then
  print('Failed to require nvim-dap-virtual-text')
end

nvim_dap_text.setup {

}

local dapui_status, dapui = pcall(require, 'dapui')
if not dapui_status then
  print('Failed to require nvim-dap-ui')
end

dapui.setup {}

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
