--- EASY PICK
-----------------------
--[[
local easypick = require("easypick")

easypick.setup({
	pickers = {
		{
			name = "Man",
			command = "aprpos",
			previewer = easypick.previewers.default(),
		},
	},
})
--]]
