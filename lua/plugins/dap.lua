-- AFTER require('mason').setup
-- see docs

local dap_status, dap = pcall(require, 'dap')
if not dap_status then
  print('Failed to require nvim-dap')
end

-- sharing launch.json with vscode
local dap_ext_vscode_status, dap_ext_vscode = pcall(require, 'dap.ext.vscode')
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

-- vscode codelldb extension
-- the extensions has a bug which causes breakpoints are not working
-- the lldb debugserver should be deleted
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = os.getenv('HOME')..'/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/adapter/codelldb',
    args = {"--port", "${port}"},
  }
}

-- nvim-dap uses 'type' field in launch.json to determine debugger
-- vscode's navite launch.json, `type` should be lldb with codelldb extension
-- to coordinate with nvim-dap, let's overwrite adapter.lldb
-- TODO: gdb 14.0+ or lldb-dap
dap.adapters.lldb = dap.adapters.codelldb

dap_ext_vscode.load_launchjs()

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

dapui.setup {
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 }
      },
      position = "left",
      size = 40
    },
    {
      elements = {
        { id = "repl", size = 1 },
      },
      position = "bottom",
      size = 10
    }
  },
}

vim.keymap.set('n', '<Leader>5', function() dap.continue() end)
vim.keymap.set('n', '<Leader>9', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>0', function() require('dap').step_over() end)
vim.keymap.set('n', '<Leader>-', function() require('dap').step_into() end)
vim.keymap.set('n', '<Leader>=', function() require('dap').step_out() end)

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
--[[ dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end ]]

vim.keymap.set('n', '<Leader>du', dapui.toggle)
