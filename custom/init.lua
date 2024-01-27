-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.opt.guicursor = ""

vim.cmd([[
  augroup My_group
    autocmd!
    autocmd BufNewFile,BufRead *.asm setfiletype asm68k
    autocmd BufNewFile,BufRead *.asm set ts=8
    autocmd BufNewFile,BufRead *.s setfiletype asm68k
    autocmd BufNewFile,BufRead *.s set ts=8
  augroup END
]])
