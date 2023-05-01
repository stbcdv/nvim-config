local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	vim.notify("no lualine", vim.log.levels.ERROR)
	return
end

-- local lualine_nightfly = require("lualine.themes.nightfly")

-- blue = "#65D1FF",
-- green = "3EFFDC",
-- violet = "#FF61EF",
-- yellow = "#FFDA7B",
-- black = "#000000",
-- local new_colors = {
-- 	bg = "#202328",
-- 	fg = "#bbc2cf",
-- 	yellow = "#ECBE7B",
-- 	cyan = "#008080",
-- 	darkblue = "#081633",
-- 	green = "#98be65",
-- 	orange = "#FF8800",
-- 	violet = "#a9a1e1",
-- 	magenta = "#c678dd",
-- 	purple = "#c678dd",
-- 	blue = "#51afef",
-- 	red = "#ec5f67",
-- 	black = "#000000",
-- }

-- lualine_nightfly.normal.a.bg = new_colors.blue
-- lualine_nightfly.insert.a.bg = new_colors.yellow
-- lualine_nightfly.visual.a.bg = new_colors.violet
-- lualine_nightfly.command = {
-- 	a = {
-- 		gui = "bold",
-- 		bg = new_colors.red,
-- 		fg = new_colors.black,
-- 	},
-- }

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	diagnostics_color = {
		-- Same values as the general color option can be used here.
		error = "DiagnosticError", -- Changes diagnostics' error color.
		warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
		info = "DiagnosticInfo", -- Changes diagnostics' info color.
		hint = "DiagnosticHint", -- Changes diagnostics' hint color.
	},
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	diff_color = { added = "DiffAdd", modified = "DiffChange", removed = "DiffDelete" },
	symbols = { added = "+ ", modified = "~ ", removed = "- " }, -- changes diff symbols
	cond = hide_in_width,
}

local date = {
	"datetime",
	style = "%H:%M:%S",
}

local mode = {
	"mode",
	-- fmt = function(str)
	-- 	return "-- " .. str .. " --"
	-- end,
}

local filetype = {
	"filetype",
	colored = false,
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto", -- powerline_dark
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "packer", "undotree", "tagbar" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode, branch, date, diagnostics },
		lualine_b = {},
		lualine_c = {},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { diff, spaces, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
