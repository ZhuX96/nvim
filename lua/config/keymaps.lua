-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copy the absolute path of the current file to the system clipboard.
vim.keymap.set("n", "<leader>yp", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("Copied path: " .. path)
end, { desc = "Copy absolute file path" })

-- Copy the current file's path relative to CWD to the system clipboard.
vim.keymap.set("n", "<leader>yr", function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  vim.notify("Copied relative path: " .. path)
end, { desc = "Copy relative file path" })

-- Copy the current file's path relative to the git repository root.
-- Notifies and aborts when the file is outside any git repo.
vim.keymap.set("n", "<leader>yg", function()
  local abs = vim.fn.expand("%:p")
  local root = vim.fs.root(0, { ".git" })
  if not root then
    vim.notify("Not in a git repo", vim.log.levels.WARN)
    return
  end
  local rel = abs:sub(#root + 2)
  vim.fn.setreg("+", rel)
  vim.notify("Copied git-relative path: " .. rel)
end, { desc = "Copy path relative to git root" })
