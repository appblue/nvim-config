-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = {'*.nim', },
  -- command = 'set shiftwidth=4',
  callback = function ()
    vim.lsp.start({
      name='nimlsp',
      cmd={'/home/kris/.nimble/bin/nimlsp'},
      root_dir='~'
    })
    vim.lsp.buf_attach_client(0, 1)
  end
})
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
