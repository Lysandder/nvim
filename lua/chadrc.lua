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

-- scrolloff = 30% of each normal window's height.
-- Floating windows (diagnostics, hover, etc.) are skipped, otherwise their tiny
-- height gets used to compute the value and it leaks into the real window.
local function update_scrolloff()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local is_float = vim.api.nvim_win_get_config(win).relative ~= ""
    if not is_float then
      local height = vim.api.nvim_win_get_height(win)
      vim.wo[win].scrolloff = math.floor(height * 0.3)
    end
  end
end

vim.api.nvim_create_autocmd(
  { "VimEnter", "VimResized", "WinEnter", "WinNew", "WinResized", "WinClosed", "BufEnter", "CursorMoved" },
  { callback = vim.schedule_wrap(update_scrolloff) }
)

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
