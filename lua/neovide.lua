if vim.g.neovide then
  -- font
  -- vim.o.guifont = 'JetbrainsMono Nerd Font:h14'
  vim.o.guifont = 'JetbrainsMonoNL Nerd Font:h14'
  -- vim.o.guifont = 'MesloLGS Nerd Font:h14'

  -- refresh rate
  vim.g.neovide_refresh_rate = 144

  vim.g.neovide_fullscreen = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_hide_mouse_when_typing = true

  vim.g.neovide_show_border = false

  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 0
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5

  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

  -- Allow clipboard copy paste in neovim
  vim.api.nvim_set_keymap(
    '',
    '<D-v>',
    '+p<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    '!',
    '<D-v>',
    '<C-R>+',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    't',
    '<D-v>',
    '<C-R>+',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    'v',
    '<D-v>',
    '<C-R>+',
    { noremap = true, silent = true }
  )

end
