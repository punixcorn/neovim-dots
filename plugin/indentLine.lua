------------------
--  indentLine.lua
------------------

--  use pywal colors
local pywal_core = require("pywal.core")
local colors = pywal_core.get_colors()

local highlight = {
	"PywalRed",
	"PywalYellow",
	"PywalBlue",
	"PywalOrange",
	"PywalGreen",
	"PywalViolet",
	"PywalCyan",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "PywalRed", { fg = colors.color5 })
	vim.api.nvim_set_hl(0, "PywalYellow", { fg = colors.color2 })
	vim.api.nvim_set_hl(0, "PywalBlue", { fg = colors.color3 })
	vim.api.nvim_set_hl(0, "PywalOrange", { fg = colors.color6 })
	vim.api.nvim_set_hl(0, "PywalGreen", { fg = colors.color1 })
	vim.api.nvim_set_hl(0, "PywalViolet", { fg = colors.color4 })
	vim.api.nvim_set_hl(0, "PywalCyan", { fg = colors.color7 })
end)

require("ibl").setup({
	indent = {
		smart_indent_cap = true,
		highlight = highlight,
	},
	whitespace = {
		highlight = highlight,
		remove_blankline_trail = false,
	},
	scope = { enabled = false },
})
