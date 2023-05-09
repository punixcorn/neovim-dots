-- COLORS
---------
-- Runs on start
--edge

function Edge()
	vim.cmd([[
    let g:edge_style = 'aura'
    let g:edge_better_performance = 1
    colorscheme edge
    let g:lightline = {'colorscheme' : 'edge'}
    ]])
end

function ManageColors(color)
	local default = "tokyobones"
	color = color or default
	vim.cmd.colorscheme(color)
	--	vim.cmd("TransparentDisable")
	-- Edge()
	-- Fix Fidget color
	vim.api.nvim_set_hl(0, "FidgetTask", { bg = "none", fg = "#70788a" })
	vim.api.nvim_set_hl(0, "FidgetTitle", { bg = "none", fg = "#70788a" })

	-- Manage Transparency
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatShadow", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatShadowThrough", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#70788a" })
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
	-- Fixes Wilder command view
	vim.api.nvim_set_hl(0, "dkoBgLight", { bg = "none" })
	-- Line numbers
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#70788a" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none", fg = "#bbbbbb" })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
	vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
	-- Normal (command output text)
	vim.api.nvim_set_hl(0, "Normal", { fg = "#ffffff" })

	-- UI vertsplit
	vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#888888" })

	-- GitGutter
	vim.api.nvim_set_hl(0, "GitGutterAdd", { bg = "none", fg = "#88bd53" })
	vim.api.nvim_set_hl(0, "DiffChange", { bg = "none", fg = "#ad8445" })
	vim.api.nvim_set_hl(0, "DiffChangeDelete", { bg = "none", fg = "#ad8445" })
	vim.api.nvim_set_hl(0, "DiffDelete", { bg = "none", fg = "#bd5c5c" })
	vim.cmd([[ 
        hi Normal guibg=none ctermbg=none
    ]])
end

-- Quick functions for fave color schemes
function Catppuccin()
	ManageColors("catppuccin-macchiato")
end

function Meh()
	ManageColors("meh")
end

function Pywall()
	ManageColors("pywal")
end

Catppuccin()
