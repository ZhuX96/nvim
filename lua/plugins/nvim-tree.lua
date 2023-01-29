vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local nvim_tree_status, nvim_tree = pcall(require, 'nvim-tree')
if not nvim_tree_status then
  print('Failed to require nvim-tree')
  return
end

nvim_tree.setup({
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
        },
      },
    },
  },

  actions = {
    open_file = {
      resize_window = true,
      window_picker = { enable = true },
    },
  },

})

vim.keymap.set('n', '<Leader>e', '<Cmd>NvimTreeToggle<CR>')
