local lint_status, lint = pcall(require, 'lint')
if not lint_status then
  print('Failed to require lint')
  return
end

lint.linters_by_ft = {
  cpp = { 'cpplint' },
}

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  callback = function()
    require('lint').try_lint()
  end,
})

