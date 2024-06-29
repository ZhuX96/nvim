vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local nvim_tree_web_devicons_status, nvim_tree_web_devicons = pcall(require, 'nvim-web-devicons')
if not nvim_tree_web_devicons_status then
  print('Failed to require nvim-web-devicons')
  return
end

local nvim_tree_status, nvim_tree = pcall(require, 'nvim-tree')
if not nvim_tree_status then
  print('Failed to require nvim-tree')
  return
end

nvim_tree.setup({
  renderer = {
    icons = {
      web_devicons = {
        file = {
          enable = true,
          color = true,
        },
        folder = {
          enable = false,
          color = true,
        },
      },
      glyphs = {
        folder = {
          arrow_closed = "⏵", -- arrow when folder is closed
          arrow_open = "⏷", -- arrow when folder is open
        },
      },
    },
    root_folder_label = false,
  },

  actions = {
    open_file = {
      resize_window = true,
      window_picker = { enable = true },
    },
  },

  update_focused_file = {
    enable = true,
  },

})

vim.keymap.set('n', '<Leader>e', '<Cmd>NvimTreeToggle<CR>')
