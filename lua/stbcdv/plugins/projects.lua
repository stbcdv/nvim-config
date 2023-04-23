local project_nvim = require("project_nvim")
local recent_projects = project_nvim.get_recent_projects()
-- local dp = project_nvim.get_cache_dir()

project_nvim.setup({
	manual_mode = false, -- add this, if in a directory path print nvim command, then this plugin can record this path, feel nothing to work
	active = true,

	-- on_config_done = nil,
	---@usage Methods of detecting the root directory
	--- Allowed values: **"lsp"** uses the native neovim lsp
	--- **"pattern"** uses vim-rooter like glob pattern matching. Here
	--- order matters: if one is not detected, the other is used as fallback. You
	--- can also delete or rearangne the detection methods.
	-- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
	detection_methods = { "pattern" },
	patterns = { ".git", ".lua", ".sv", "src", "Makefile", "makefile", "readme", "ReadMe" },

	-- Table of lsp clients to ignore by name
	-- eg: { "efm", ... }
	ignore_lsp = {},

	-- Don't calculate root dir on specific directories
	-- Ex: { "~/.cargo/*", ... }
	exclude_dirs = {},

	-- Show hidden files in telescope
	show_hidden = false,

	-- When set to false, you will get a message when project.nvim changes your
	-- directory.
	silent_chdir = true,

	-- What scope to change the directory, valid options are
	-- * global (default)
	-- * tab
	-- * win
	scope_chdir = "global",

	---@type string
	---@usage path to store the project history for use in telescope
	-- datapath = dp,
})

-- print(vim.inspect(recent_projects))
