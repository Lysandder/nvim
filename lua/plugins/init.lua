return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require("configs.conform")
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

        -- Formatters
        -- "black",
        "autopep8",
        "prettier",
      },
    },

    -- Automatic installation but it did not work
    -- automatic_installation = true,
  },
}
