local nvim_cmp_status, nvim_cmp = pcall(require, 'cmp')
if not nvim_cmp_status then
  print('Failed to require nvim-cmp')
  return
end

local luasnip_status, luasnip = pcall(require, 'luasnip')
if not luasnip_status then
  print('Failed to require luasnip')
  return
end

local lspkind_status, lspkind = pcall(require, 'lspkind')
if not lspkind_status then
  print('Failed to require lspkind')
  return
end

require('luasnip/loaders/from_vscode').lazy_load()

vim.opt.completeopt = 'menu,menuone,noselect'

nvim_cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },

  mapping =nvim_cmp.mapping.preset.insert({
    ['<C-k>'] = nvim_cmp.mapping.select_prev_item(),
    ['<C-j>'] = nvim_cmp.mapping.select_next_item(),
    ['<C-b>'] = nvim_cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = nvim_cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = nvim_cmp.mapping.complete(),
    ['<C-e>'] = nvim_cmp.mapping.abort(),
    ['<CR>'] = nvim_cmp.mapping.confirm({ select = false }),

    ['<Tab>'] = nvim_cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if nvim_cmp.visible() then
        nvim_cmp.select_next_item()
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        nvim_cmp.complete()
      end
    end, {'i', 's'}),

    ['<S-Tab>'] = nvim_cmp.mapping(function(fallback)
      if nvim_cmp.visible then
        nvim_cmp.select_prev_item()
      else
        fallback()
      end
    end, {'i', 's'})
  }),

  sources = nvim_cmp.config.sources({
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path'}
  }),

  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '...'
    })
  }
}
