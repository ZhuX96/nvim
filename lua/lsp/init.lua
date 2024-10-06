local mason_status, mason = pcall(require, 'mason')
if not mason_status then
  print('Failed to require mason')
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_status then
  print('Failed to require mason-spconfig')
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status then
  print('Failed to require cmp-nvim-lsp')
  return
end

local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
  print('Failed to require lspconfig')
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

mason.setup({
  providers = {
    'mason.providers.registry-api',
    'mason.providers.client'
  }
})

mason_lspconfig.setup({ ensure_installed = { 'lua_ls', 'clangd' } })
mason_lspconfig.setup_handlers {
  function (server_name)
    require('lspconfig')[server_name].setup {}
  end,

  ['clangd'] = function ()
    lspconfig.clangd.setup {
      capabilities = capabilities,
      cmd = {
        'clangd',
        '--background-index',
        '-j=6',
        '--all-scopes-completion',
        '--completion-style=detailed',
        '--function-arg-placeholders',
        '--header-insertion=never',
        '--pch-storage=disk',
      }
    }
  end,

  ['ts_ls'] = function ()
    lspconfig.ts_ls.setup {
      capabilities = capabilities,
      init_options = {
        preferences = {
          importModuleSpecifierPreference = 'project-relative',
          jsxAttributeCompletionStyle = 'none',
        }
      }
    }
  end,

  ['lua_ls'] = function ()
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } },
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.stdpath('config') .. '/lua'] = true
            }
          }
        }
      }
    }
  end,

  ['gopls'] = function ()
    lspconfig.gopls.setup {
      capabilities = capabilities
    }
  end,

  ['rust_analyzer'] = function ()
    lspconfig.rust_analyzer.setup {
      capabilities = capabilities,
      check = {
        command = 'clippy',
      }
    }
  end,
}

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<Leader><Leader>q', vim.diagnostic.setloclist, opts)

--[[ local telescope_builtin_status, telescope_builtin= pcall(require, 'telescope.builtin')
if not telescope_builtin_status then
  print('Failed to require telescope_builtin')
  return
end ]]

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufopts = { noremap = true, silent = true, buffer = args.buf}
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- vim.keymap.set('n', 'gtr', telescope_builtin.lsp_references, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
    -- :LspRestart
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
  end
})
