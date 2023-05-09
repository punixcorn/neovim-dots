-- TELESCOPE
------------
local telescope = require("telescope")

-- Configure telescope to search hidden files, (except .git and .node_modules)
telescope.setup({
	defaults = {
		disable_devicons = false,
		color_devicons = true,
	},
})

telescope.load_extension("file_browser")
-- Keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fs", builtin.find_files, {})
vim.keymap.set("n", "<leader>man", builtin.man_pages, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>h", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>bu", builtin.buffers, {})

vim.keymap.set("n", "<leader>reg", builtin.registers, {})
vim.keymap.set("n", "<leader>dic", builtin.spell_suggest, {})
vim.keymap.set("n", "<leader>reg", builtin.registers, {})

vim.keymap.set("n", "<leader>typ", builtin.lsp_definitions, {})
vim.keymap.set("n", "<leader>mp", builtin.lsp_implementations, {})
vim.keymap.set("n", "<leader>doc", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>ref", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>com", builtin.commands, {})
