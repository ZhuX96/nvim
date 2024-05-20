local neogen_status, neogen = pcall(require, "neogen")
if not neogen_status then
  print('Failed to require neogen')
end

neogen.setup {}
