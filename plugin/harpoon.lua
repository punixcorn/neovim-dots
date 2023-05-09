-- HARPOON
----------

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require("harpoon.term")

-- Keybindings
vim.keymap.set("n", "<C-a>", function()
	mark.add_file()
	print("[harpoon] File added")
end)
vim.keymap.set("n", "<C-d>", function()
	mark.rm_file(vim.fn.expand("%"))
	print("[harpoon] mark deleted")
end)
vim.keymap.set("n", "<leader>hs", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-m>", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-k>", ui.nav_next)
vim.keymap.set("n", "<C-j>", ui.nav_prev)
vim.keymap.set("n", "<C-t>", function()
	term.gotoTerminal(1)
end)
