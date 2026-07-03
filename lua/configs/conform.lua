local options = {
  formatters_by_ft = {
    css = { "prettier" },
    html = { "prettier" },
    java = { "google-java-format" },
    lua = { "stylua" },
    python = { "autopep8" },
    cpp = { "clangd" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 1000,
  --   lsp_fallback = true,
  -- },
}

return options
