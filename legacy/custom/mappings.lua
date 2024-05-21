---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>zz"] = { ":source %<CR>", "evaluate current file", opts = { nowait = false } },
  },
}

-- more keybinds!

return M
