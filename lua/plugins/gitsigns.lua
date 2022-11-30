local gitsigns_status, gitsigns = pcall(require, 'gitsigns')
if not gitsigns_status then
  print('Failed to reuqire gitsigns')
  return
end

gitsigns.setup {}
