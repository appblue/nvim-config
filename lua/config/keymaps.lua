-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local terminal = require("nvterm.terminal")

-- local ft_cmds = {
--  python = "python3 " .. vim.fn.expand('%'),
-- }

local toggle_modes = { "n", "t" }
local mappings = {
  -- { 'n', '<C-l>', function () terminal.send(ft_cmds[vim.bo.filetype]) end },
  {
    toggle_modes,
    "<A-h>",
    function()
      terminal.toggle("horizontal")
    end,
  },
  {
    toggle_modes,
    "<A-v>",
    function()
      terminal.toggle("vertical")
    end,
  },
  {
    toggle_modes,
    "<A-i>",
    function()
      terminal.toggle("float")
    end,
  },
}
local opts = { noremap = true, silent = true }
for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end

vim.keymap.set("n", "<space><space>z", ":source %<CR>")
vim.keymap.set("n", "<space>z", ":.lua<CR>")
vim.keymap.set("v", "<space>z", ":lua<CR>")

vim.keymap.set("n", "<space><space>t", function()
  vim.cmd([[
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
]])
end)
