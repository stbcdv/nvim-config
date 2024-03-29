local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	vim.notify("no telescope", vim.log.levels.ERROR)
	return
end
-- local builtin = require('telescope.builtin')
local telescopeConfig = require("telescope.config")

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	vim.notify("no telescope_actions", vim.log.levels.ERROR)
	return
end

-- Clone the default Telescope configuration
-- local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
-- -- I want to search in hidden/dot files.
-- table.insert(vimgrep_arguments, "--hidden")
-- -- I don't want to search in the `.git` directory.
-- table.insert(vimgrep_arguments, "--glob")
-- table.insert(vimgrep_arguments, "!**/.git/*")
local vimgrep_arguments = {
	"rg",
	"--color=never",
	"--no-heading",
	"--with-filename",
	"--line-number",
	"--column",
	"--smart-case",
	"--hidden",
	"--glob=!.git/",
}

telescope.setup({
	defaults = {
		vimgrep_arguments = vimgrep_arguments,
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },

		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<esc>"] = actions.close, -- ["<C-c>"] = actions.close
			},
			n = {
				["<esc>"] = actions.close,
			},
		},
		entry_prefix = "  ",
		multi_icon = " ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.70,
			preview_cutoff = 120,
		},
	},
	pickers = {
		find_files = {
			-- theme = "dropdown",
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			-- find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("projects")
telescope.load_extension("neoclip")
