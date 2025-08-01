-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- EXAMPLE
local servers = {
  -- "lua_ls",
  "html",
  "cssls",
  "pyright",
  "ts_ls",
  "clangd",
}

local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

-- Ensure Neovim enforces 2-space indentation for all buffers
-- With filetypes specified
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "html",
    "css",
    "python",
    "typescript",
    "javascript",
    "lua",
    "cpp",
    "c",
  },

  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true -- Use spaces instead of tabs
  end,
})

vim.diagnostic.config({
  virtual_text = false,  -- Disable inline text
  signs = true,          -- Keep the sign column with icons
  underline = true,      -- Keep underlines for errors/warnings
  update_in_insert = false,
})

-- To change indentation size in autopep8 I had to create a file ~/.config/pep8 and write in it:
-- [pep8]
-- indent-size = 2

-- Typescript example
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
