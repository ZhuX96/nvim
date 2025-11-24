return {
  {
    "neovim/nvim-lspconfig",
    -- rm -rf ~/.local/share/nvim/lazy/mason.nvim
    -- rm -rf ~/.local/share/nvim/lazy/mason-lspconfig.nvim
    -- rm -f ~/.config/nvim/lazy-lock.json
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      ----------------------------------------------------------------------
      -- Lua: lua_ls
      ----------------------------------------------------------------------
      opts.servers.lua_ls = vim.tbl_deep_extend("force", opts.servers.lua_ls or {}, {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            codeLens = {
              enable = true,
            },
            completion = {
              callSnippet = "Replace",
            },
            doc = {
              privateName = { "^_" },
            },
            hint = {
              enable = true,
              setType = false,
              paramType = true,
              paramName = "Disable",
              semicolon = "Disable",
              arrayIndex = "Disable",
            },
          },
        },
      })

      ----------------------------------------------------------------------
      -- C++: clangd
      ----------------------------------------------------------------------
      opts.servers.clangd = vim.tbl_deep_extend("force", opts.servers.clangd or {}, {
        cmd = {
          "clangd",
          "--background-index",
          "-j=6",
          "--all-scopes-completion",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--header-insertion=never",
          "--pch-storage=disk",
        },
      })

      ----------------------------------------------------------------------
      -- Rust: rust_analyzer
      ----------------------------------------------------------------------
      opts.servers.rust_analyzer = vim.tbl_deep_extend("force", opts.servers.rust_analyzer or {}, {
        settings = {
          ["rust-analyzer"] = {
            imports = {
              granularity = { group = "module" },
              prefix = "self",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
          },
        },
      })
    end,
  },
}
