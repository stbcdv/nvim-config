local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	vim.notify("no lualine", vim.log.levels.ERROR)
	return
end

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

-- local buffers = {
-- 	"buffers",
-- 	show_filename_only = true, -- Shows shortened relative path when set to false.
-- 	hide_filename_extension = true, -- Hide filename extension when set to true.
-- 	show_modified_status = true, -- Shows indicator when the buffer is modified.

-- 	mode = 0, -- 0: Shows buffer name
-- 	-- 1: Shows buffer index
-- 	-- 2: Shows buffer name + buffer index
-- 	-- 3: Shows buffer number
-- 	-- 4: Shows buffer name + buffer number

-- 	-- max_length = vim.o.columns * 2 / 3,
-- 	max_length = 1,
-- }

local filename = {
	"filename",
	file_status = true, -- Displays file status (readonly status, modified status)
	newfile_status = false, -- Display new file status (new file means no write after created)
	path = 0, -- 0: Just the filename
	-- 1: Relative path
	-- 2: Absolute path
	-- 3: Absolute path, with tilde as the home directory
	-- 4: Filename and parent dir, with tilde as the home directory

	shorting_target = 40, -- Shortens path to leave 40 spaces in the window
	-- for other components. (terrible name, any suggestions?)
	symbols = {
		modified = "[+]", -- Text to show when the file is modified.
		readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
		unnamed = "[No Name]", -- Text to show for unnamed buffers.
		newfile = "[New]", -- Text to show for newly created file before first write
	},
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
		disabled_filetypes = {
			"alpha",
			"dashboard",
			"NvimTree",
			"Outline",
			"packer",
			"undotree",
			"tagbar",
			"lspsagaoutline",
		},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode, branch, filename },
		lualine_b = { date },
		lualine_c = { diagnostics },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { diff, spaces, "encoding", "fileformat", filetype },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { filename },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
