local lazy = require("lazy")
return {
  -- Show gitignored files too
  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      opts.filters.git_ignored = false
    end,
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require("configs.conform"),
  },

  -- New lspconfig
  -- {
  --   "neovim/nvim-lspconfig",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require("configs.lspconfig")
  --   end,
  -- },

  -- Standard lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },

  -- Treesitter before
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },

  -- Treesitter as the separate file
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("configs.treesitter")
    end,
  },

  -- Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSPs
        -- "lua-language-server",
        "html-lsp",
        "css-lsp",
        "pyright",
        "ts_ls",
        "clangd",

        -- Formatters
        -- "black",
        "autopep8",
        "prettier",
      },
    },

    -- Automatic installation but it did not work
    -- automatic_installation = true,
  },

  -- Linting
  -- {
  --   "mfussenegger/nvim-lint",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     require("configs.lint")
  --   end,
  -- },

  -- NeoVim Surround
  {
    "kylechui/nvim-surround",
    -- version = "*", -- Use for stability; omit to use `main` branch for the latest features
    -- event = "VeryLazy",
    lazy = false, -- Load immediately instead of lazy-loading
    config = function()
      require("nvim-surround").setup({}) -- Configuration here, or leave empty to use defaults
    end,
  },

  -- nvim-ufo folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" }, -- Ensure dependency is installed
    lazy = false, -- Load immediately instead of lazy-loading
    config = function()
      require("ufo").setup({})
    end,
  },

  -- emmet-ls
  {
    "aca/emmet-ls",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local nvlsp = require("nvchad.configs.lspconfig")

      lspconfig.emmet_ls.setup({
        -- on_attach = nvlsp.on_attach,
        capabilities = nvlsp.capabilities,
        filetypes = {
          "html",
          "css",
          "javascript",
          "javascriptreact",
          "typescriptreact",
          "vue",
        },
        init_options = {
          html = {
            options = {
              -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
              ["bem.enabled"] = true,
            },
          },
        },
      })
    end,
  },
}
