-- lua/plugins/nvim-treesitter.lua

return {
  "nvim-treesitter/nvim-treesitter",
  keys = {
    { "<CR>", desc = "Increment Selection" },
    { "<bs>", desc = "Decrement Selection", mode = "x" },
  },
  opts = {
    auto_install = true,
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
}
