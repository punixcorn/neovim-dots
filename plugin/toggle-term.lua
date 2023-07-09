-- ToggleTerm
-------------
vim.keymap.set("n", "<leader>t", ":ToggleTerm <CR>")
vim.cmd([[
tnoremap <ESC> <C-\><C-n>
]])
vim.cmd([[
tnoremap jk <C-\><C-n>
]])
