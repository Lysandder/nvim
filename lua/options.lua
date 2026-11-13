require "nvchad.options"

if not vim.env.SDKROOT or vim.env.SDKROOT == "" then
  local sdk = vim.fn.system("xcrun --show-sdk-path"):gsub("%s+$", "")
  if vim.v.shell_error == 0 and sdk ~= "" then
    vim.env.SDKROOT = sdk
  end
end

require("luasnip.loaders.from_lua").lazy_load({
  paths = vim.fn.stdpath("config") .. "/lua_snippets",
})

-- add yours here!

-- local o = vim.o

-- o.cursorlineopt ='both' -- to enable cursorline!

-- ufo folding
vim.opt.foldcolumn = "auto"
vim.opt.foldlevelstart = 99 -- 99 to unfold everything on opening a file, 0 for the opposite

vim.opt.title = true
vim.opt.titlestring = "nvim - %{fnamemodify(getcwd(), ':t')}"
