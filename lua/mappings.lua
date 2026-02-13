require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "fj", "<ESC>")
map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
map("n", "<leader>t", ":startinsert!<CR>", { noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Setting up the width of the vertical terminal & removing the bug with the showing (.venv) icon.
map("n", "<leader>v", function()
  local total_width = vim.api.nvim_get_option_value("columns", { scope = "global" })
  local win_count = #vim.api.nvim_list_wins() + 1
  local desired_width = math.floor(total_width / win_count)

  local venv = vim.env.VIRTUAL_ENV
  if venv then
    vim.cmd("vsplit term://env -u VIRTUAL_ENV zsh")
  else
    vim.cmd("vsplit term://zsh")
  end

  vim.cmd("vertical resize " .. desired_width)

  local base_name = "zsh"
  local suffix = 1
  local new_name = base_name .. " [1]"
  while vim.fn.bufexists(new_name) == 1 do
    suffix = suffix + 1
    new_name = base_name .. " [" .. suffix .. "]"
  end
  vim.api.nvim_buf_set_name(0, new_name)

  vim.wo.number = false
  vim.wo.relativenumber = false
  vim.wo.signcolumn = "no"
end, { desc = "Open vertical zsh terminal without VIRTUAL_ENV" })
