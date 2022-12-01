local telescope_status, telescope = pcall(require, 'telescope')
if not telescope_status then
  print('Failed to require telescope')
  return
end

local telescope_actions_status, telescope_actions = pcall(require, "telescope.actions")
if not telescope_actions_status then
  print('Failed to require telescode.actions')
  return
end

telescope.setup {}
telescope.load_extension("fzf")
