local nvim_cmp_status, nvim_cmp = pcall(require, 'cmp')
if not nvim_cmp_status then
  print('Failed to require nvim-cmp')
  return
end

local lspkind_status, lspkind = pcall(require, 'lspkind')
if not lspkind_status then
  print('Failed to require lspkind')
  return
end

nvim_cmp.setup {
  mapping =nvim_cmp.mapping.preset.insert({
    ["<C-k>"] =nvim_cmp.mapping.select_prev_item(),
    ["<C-j>"] =nvim_cmp.mapping.select_next_item(),
    ["<C-b>"] =nvim_cmp.mapping.scroll_docs(-4),
    ["<C-f>"] =nvim_cmp.mapping.scroll_docs(4),
    ["<C-Space>"] =nvim_cmp.mapping.complete(),
    ["<C-e>"] =nvim_cmp.mapping.abort(),
    ["<CR>"] =nvim_cmp.mapping.confirm({ select = false }),
  }),

  sources = nvim_cmp.config.sources({
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
