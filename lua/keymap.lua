-- VIM REMAPS
-------------
-- Toggle NETRW
-- vim.keymap.set("n", "<leader>b", ":Ex<CR>")

-- Set leader key
vim.g.mapleader = " "

-- Write / save
vim.keymap.set("n", "<leader>s", ":w<CR>")

-- Nvim Tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- Toggle line numbers
vim.keymap.set("n", "<leader>n", ":set invnumber invrelativenumber<CR>")

-- Toggle
vim.keymap.set("n", "<leader><TAB>", ":set invlist<CR>")

-- Toggle cmdheight
vim.keymap.set("n", "<leader>c", function()
	local cmdheight = vim.api.nvim_get_option("cmdheight")
	if cmdheight == 1 then
		vim.api.nvim_set_option("cmdheight", 0)
	else
		vim.api.nvim_set_option("cmdheight", 1)
	end
end)

-- Paste replace visual selection without copying it
vim.keymap.set("v", "p", '"_dP')

-- Run current line as shell command, replace with output
vim.keymap.set("n", "Q", "!!zsh<CR>")

-- Move lines up and down
vim.keymap.set("n", "<A-j>", ":move .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":move .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv")

-- Disable arrow keys
vim.keymap.set("n", "<Left>", ":echo 'Use h ya twat'<CR>")
vim.keymap.set("n", "<Right>", ":echo 'Use l ya twat'<CR>")
vim.keymap.set("n", "<Up>", ":echo 'Use k ya twat'<CR>")
vim.keymap.set("n", "<Down>", ":echo 'Use j ya twat'<CR>")

-- Set jk to esc
vim.keymap.set("i", "jk", "<ESC>")
