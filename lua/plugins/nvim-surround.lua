local surround_status, surround = pcall(require, 'nvim-surround')
if not surround_status then
  print('Failed to require nvim-surround')
  return
end

surround.setup({})
