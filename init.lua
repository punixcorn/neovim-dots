require("plugins") -- where all the plugins install are
require("keymap") -- where the keymaps are
require("settings") -- where the settings are

--[[ Folder Structure
├── init.lua 		   ->load all the lua files in the lua folder
├── lua
│   ├── keymap.lua 	  ->keymaps
│   ├── plugs.lua 	  ->plugins
│   └── settings.lua  ->settings
├── plugin  		  ->plugin settings
    └──... 		      ->all plugin configs
--]]
