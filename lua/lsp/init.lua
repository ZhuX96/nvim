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

local capabilities = cmp_nvim_lsp.default_capabilities()

mason.setup({
  providers = {
    'mason.providers.registry-api',
    'mason.providers.client'
  }
})

mason_lspconfig.setup({ ensure_installed = { 'sumneko_lua', 'clangd' } })
mason_lspconfig.setup_handlers {
  function (server_name)
    require('lspconfig')[server_name].setup {}
  end,

  ['clangd'] = function ()
    require('lspconfig').clangd.setup {
      capabilities = capabilities
    }
  end,

  ['sumneko_lua'] = function ()
    require('lspconfig').sumneko_lua.setup {
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
  end
}

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufopts = { noremap = true, silent = true, buffer = args.buf}
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
    -- :LspRestart
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
  end
})
