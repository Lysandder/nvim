-- -- lua/configs/jdtls.lua
--
-- local jdtls = require("jdtls")
-- local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
--
-- -- Give each project its own workspace so state doesn't bleed between projects
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
-- local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. project_name
--
-- local config = {
--   cmd = { "jdtls", "--data", workspace_dir },
--
--   root_dir = vim.fs.root(0, { "gradlew", "mvnw", "pom.xml", "build.gradle", ".git" }),
--
--   settings = {
--     java = {
--       -- Indentation: matches your 4-space setup for Java
--       format = {
--         settings = {
--           tabSize = 4,
--           insertSpaces = true,
--         },
--       },
--     },
--   },
--
--   init_options = {
--     bundles = {},
--   },
--
--   -- Reuse NvChad's on_attach and capabilities so keymaps work the same as your other LSPs
--   on_attach = require("nvchad.configs.lspconfig").on_attach,
--   capabilities = require("nvchad.configs.lspconfig").capabilities,
-- }
--
-- return config



-- lua/configs/jdtls.lua

local jdtls = require("jdtls")
local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

-- Give each project its own workspace so state doesn't bleed between projects
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. project_name

local config = {
  cmd = { "jdtls", "--data", workspace_dir },

  root_dir = vim.fs.root(0, { "gradlew", "mvnw", "pom.xml", "build.gradle", ".git" }),

  settings = {
    java = {
      -- Indentation: matches your 4-space setup for Java
      format = {
        settings = {
          tabSize = 4,
          insertSpaces = true,
        },
      },
    },
  },

  init_options = {
    bundles = {},
  },

  -- Reuse NvChad's on_attach and capabilities so keymaps work the same as your other LSPs
  on_attach = require("nvchad.configs.lspconfig").on_attach,
  capabilities = require("nvchad.configs.lspconfig").capabilities,
}

return config
