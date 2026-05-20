-- after/plugin/jdtls.lua

-- Only run when opening a Java file, not for every buffer
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    local config = require("configs.jdtls")
    require("jdtls").start_or_attach(config)
  end,
})
