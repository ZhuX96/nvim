-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- window
--   window navigation
--     Delete LazyVim's default window navigation keymap
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")
--     Custom window navigation keymap
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- others
--   disable keywordprg
vim.keymap.del("n", "<leader>K")
