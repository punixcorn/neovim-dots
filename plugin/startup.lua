local status_ok, alpha = pcall(require, "alpha")
local dashboard = require("alpha.themes.dashboard")

if not status_ok then
	return
end

-- Function to retrieve console output
local function capture(cmd)
	local handle = assert(io.popen(cmd, "r"))
	local output = assert(handle:read("*a"))
	handle:close()
	return output
end

local function get_plugins_list()
	local short_name = require("packer.util").get_plugin_short_name
	local list_plugins = require("packer.plugin_utils").list_installed_plugins

	local opt, start = list_plugins()
	local plugin_paths = vim.tbl_extend("force", opt, start)
	local plugins = {}

	for path in pairs(plugin_paths) do
		local name, _ = short_name({ path }):gsub(".nvim", "")
		table.insert(plugins, name)
	end

	table.sort(plugins)

	return plugins
end

local function button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 5,
		width = 30,
		align_shortcut = "right",
		hl_shortcut = "Keyword",
	}

	if keybind then
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "normal", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

-- Obtain Date Info
local date = io.popen('echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"')
local date_info = "󰨲 Today is " .. date:read("*a")
date:close()

-- Configuration
Header = {
	"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣀⣀⣤⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⣿⣿⣿⣿⣿⣿⣿⣿⢟⢍⣼⣿⣿⣿⣿⣿⡝⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⣿⣿⣿⣿⣿⣿⢟⣵⢏⣾⣿⣿⣿⣷⣿⣟⣤⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⣿⣿⣿⣿⣿⣫⡿⠋⠀⢻⣿⣿⣿⡿⠿⢸⠏⠠⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⣿⣿⣿⣿⢣⠟⠀⠀⠀⠀⠙⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⣿⣿⣿⣿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⢠⡀⠀⠀⠀⠀",
	"⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⣸⣧⠀⠀⠀⠀",
	"⣿⠻⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢀⠈⠉⠑⠀⠀⢀⠀⠀⠀⡄⢩⣿⣧⡀⣖⢋",
	"⣿⣷⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡦⡜⣤⢸⣦⣸⣦⡀⠀⢸⡆⠀⡀⠀⢈⠀",
	"⣿⣿⠁⠀⠀⣴⡆⠀⠀⠀⠀⢀⠀⣻⣿⣿⣽⣿⣿⣿⣿⣿⣷⣾⣧⢦⣵⣄⣿⠀",
	"⣿⣿⡄⣰⣬⣿⣇⠀⠀⠀⠀⢸⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀",
	"⣯⣝⣷⣿⡿⢻⣿⡄⠀⠀⢸⣦⠀⠀⡹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀",
	"⣿⣿⢯⣶⣿⣿⣿⣿⣦⣀⠘⢿⢨⡆⡜⣶⡝⠿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⣀⣠",
	"⣽⣯⣾⣿⣿⣿⡿⠛⠿⠿⠿⠒⠻⠓⢚⢘⣴⣿⡬⣝⣛⣻⣽⣶⣏⡄⢸⣿⠋⡟",
}

-- Config gif header
require("alpha.term")

-- used to get the obtain height and width for the gifs
function Getgif(str)
	str = str or "love_death_and_robot"
	local cmd = "chafa -c full --fg-only --symbols braille ~/.config/nvim/static/" .. str .. ".gif"
	if str == "madara" or str == "love_death_and_robot" or str == "eye" or str == "wolf" or "kakashi_fight" then
		return cmd, 60, 20
	elseif str == "sharingan" or str == "love_death_and_robot" then
		return cmd, 90, 20
	end
end

-- available options madara,sharingan,
math.randomseed(os.time())
---@type number
local index = math.random(1, 6)
---@type table
local HeaderType = { "madara", "love_death_and_robot", "eye", "wolf", "sharingan", "kakashi_fight" }

-- for random use this
local tempCommand, tempWidth, tempHeight = Getgif(HeaderType[index])
-- for specific use this
--local tempCommand, tempWidth, tempHeight = Getgif("kakashi_fight")
local dynamic_header = {
	type = "terminal",
	command = tempCommand,
	width = tempWidth,
	height = tempHeight,

	opts = {
		position = "center",
		redraw = true,
		window_config = {},
	},
}

local text_header = {
	type = "text",
	val = Header,
	opts = {
		position = "center",
		hl = "Type",
	},
}

local date_today = {
	type = "text",
	val = date_info,
	opts = {
		position = "center",
		hl = "Keyword",
	},
}

local buttons = {
	type = "group",
	val = {
		button("f", " -> Find file", ":Telescope find_files <CR>"),
		button("e", " -> File Broswer", ":Telescope file_browser <CR>"),
		button("p", " -> Find project", ":Telescope projects <CR>"),
		button("q", " -> quit", ":q!<CR>"),
		-- button("r, " -> Recently used files", ":Telescope oldfiles <CR>"),
		button("c", " -> Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	},
	opts = {
		spacing = 1,
	},
}

local plugins = get_plugins_list()
local plugins_count = #plugins
local Fortune = require("alpha.fortune")
local txtfortune = table.concat(Fortune(), "\n")

local footer = {
	type = "text",
	--	val = table.concat(Fortune(), "\n"),
	val = "- Neovim with " .. plugins_count .. " 󰚥 installed \n" .. txtfortune .. "\n",
	opts = {
		position = "center",
		hl = "Number",
	},
}

local section = {
	header = dynamic_header,
	date = date_today,
	buttons = buttons,
	footer = footer,
}

local opts = {
	layout = {
		{ type = "padding", val = 0 },
		section.header,
		{ type = "padding", val = 18 },
		section.date,
		{ type = "padding", val = 2 },
		section.buttons,
		{ type = "padding", val = 1 },
		section.footer,
		{ type = "padding", val = 5 },
	},
	opts = {
		margin = 5,
		noautocmd = true,
		redraw_on_resize = true,
	},
}

dashboard.opts = opts
alpha.setup(dashboard.opts)
