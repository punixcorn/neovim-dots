-- COLORS : set the colorscheme
---------

--[[ 
--    i dunno how i dont have to call this for pywall, but i dont
    local pywal = require("pywal")
    pywal.setup()
--]]

function ManageColors(color)
	local default = "meh"
	color = color or default
	vim.cmd.colorscheme(color)
end

-- Quick functions for fave color schemes
function Catppuccin()
	ManageColors("catppuccin-macchiato")
end

function Edge()
	vim.cmd([[
    let g:edge_style = 'aura'
    let g:edge_better_performance = 1
    colorscheme edge
    let g:lightline = {'colorscheme' : 'edge'}
    ]])
end

function Meh()
	ManageColors("meh")
end

function Pywall()
	ManageColors("pywal")
end

--ManageColors("github_dark_dimmed")
--Catppuccin()
Pywall()
--Meh()
