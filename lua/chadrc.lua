-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- vim.o.scrolloff = 15
local function update_scrolloff()
  local win_height = vim.api.nvim_win_get_height(0)
  local percent = 0.3
  local scrolloff = math.floor(win_height * percent)

  -- Optional: clamp between 3 and 15
  scrolloff = math.max(3, math.min(scrolloff, 15))

  vim.opt.scrolloff = scrolloff
end

-- Update scrolloff on events that might change window height
vim.api.nvim_create_autocmd({ "VimResized", "WinEnter", "WinNew", "WinResized", "BufEnter" }, {
  callback = update_scrolloff,
})

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
