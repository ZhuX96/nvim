local feline_status, feline = pcall(require, 'feline')
if not feline_status then
  print('Failed to require feline')
  return
end

feline.setup()
