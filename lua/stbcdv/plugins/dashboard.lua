local api = vim.api
local keymap = vim.keymap
local status, db = pcall(require, "dashboard")
local vim = vim
-- local utils = require("dashboard.utils")
-- event = "VimEnter"
if not status then
	vim.notify("no dashboard", vim.log.levels.ERROR)
	return
end

local custom_header = {
	"",
	"",
	"",
	"",
	"⡆⣐⢕⢕⢕⢕⢕⢕⢕⢕⠅⢗⢕⢕⢕⢕⢕⢕⢕⠕⠕⢕⢕⢕⢕⢕⢕⢕⢕⢕",
	"⢐⢕⢕⢕⢕⢕⣕⢕⢕⠕⠁⢕⢕⢕⢕⢕⢕⢕⢕⠅⡄⢕⢕⢕⢕⢕⢕⢕⢕⢕",
	"⢕⢕⢕⢕⢕⠅⢗⢕⠕⣠⠄⣗⢕⢕⠕⢕⢕⢕⠕⢠⣿⠐⢕⢕⢕⠑⢕⢕⠵⢕",
	"⢕⢕⢕⢕⠁⢜⠕⢁⣴⣿⡇⢓⢕⢵⢐⢕⢕⠕⢁⣾⢿⣧⠑⢕⢕⠄⢑⢕⠅⢕",
	"⢕⢕⠵⢁⠔⢁⣤⣤⣶⣶⣶⡐⣕⢽⠐⢕⠕⣡⣾⣶⣶⣶⣤⡁⢓⢕⠄⢑⢅⢑",
	"⠍⣧⠄⣶⣾⣿⣿⣿⣿⣿⣿⣷⣔⢕⢄⢡⣾⣿⣿⣿⣿⣿⣿⣿⣦⡑⢕⢤⠱⢐",
	"⢠⢕⠅⣾⣿⠋⢿⣿⣿⣿⠉⣿⣿⣷⣦⣶⣽⣿⣿⠈⣿⣿⣿⣿⠏⢹⣷⣷⡅⢐",
	"⣔⢕⢥⢻⣿⡀⠈⠛⠛⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⠛⠛⠁⠄⣼⣿⣿⡇⢔",
	"⢕⢕⢽⢸⢟⢟⢖⢖⢤⣶⡟⢻⣿⡿⠻⣿⣿⡟⢀⣿⣦⢤⢤⢔⢞⢿⢿⣿⠁⢕",
	"⢕⢕⠅⣐⢕⢕⢕⢕⢕⣿⣿⡄⠛⢀⣦⠈⠛⢁⣼⣿⢗⢕⢕⢕⢕⢕⢕⡏⣘⢕",
	"⢕⢕⠅⢓⣕⣕⣕⣕⣵⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣕⢕⢕⢕⢕⡵⢀⢕⢕",
	"⢑⢕⠃⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⢕⢕⢕",
	"⣆⢕⠄⢱⣄⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢁⢕⢕⠕⢁",
	"⣿⣦⡀⣿⣿⣷⣶⣬⣍⣛⣛⣛⡛⠿⠿⠿⠛⠛⢛⣛⣉⣭⣤⣂⢜⠕⢑⣡⣴⣿",
	"",
	"",
	"",
}

local custom_footer = { "", "", "Everyday is new day, don't listen this!" }

local custom_center = {
	{
		icon = "󰮗  ",
		desc = "Find  File                              <leader>ff",
		action = "Telescope find_files",
		-- shortcut = "<Leader> f f",
	},
	{
		icon = "󱋢  ",
		desc = "Recently opened files                   <leader>fr",
		action = "Telescope oldfiles",
		-- shortcut = "<Leader> f r",
	},
	{
		-- 
		icon = "󰪻  ",
		desc = "Projects grep                           <leader>fp",
		action = "Telescope projects",
		-- action = "Telescope projects theme=dropdown",
		-- shortcut = "<Leader> f g",
	},
	{
		-- 󱁻
		icon = "󰡇  ",
		desc = "Open Nvim config                        ",
		action = "tabnew $MYVIMRC | tcd %:p:h",
		-- shortcut = "n",
	},
	{
		icon = "󰻭  ",
		desc = "New file                                e",
		action = "enew",
	},
	{
		icon = "󱐤  ",
		desc = "Quit Nvim                               q",
		action = "qa",
	},
}

db.setup({
	theme = "doom",
	config = {
		header = custom_header,
		center = custom_center,
		footer = custom_footer,
	},
})

api.nvim_create_autocmd("FileType", {
	pattern = "dashboard",
	group = api.nvim_create_augroup("dashboard_enter", { clear = true }),
	callback = function()
		keymap.set("n", "q", ":qa<CR>", { buffer = true, silent = true })
		keymap.set("n", "e", ":enew<CR>", { buffer = true, silent = true })
	end,
})
