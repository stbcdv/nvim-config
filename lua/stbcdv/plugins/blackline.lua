vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { pattern = "*", command = "EnableHL" })
require("hlchunk").setup({
	chunk = {
		enable = true,
		use_treesitter = true,
		style = {
			{ fg = "#806d9c" },
		},
	},
	indent = {
		chars = { "│", "¦", "┆", "┊" }, -- more code can be found in https://unicodeplus.com/
		style = {
			-- "#8B00FF",
			use_treesitter = false,
		},
	},
	blank = {
		enable = false,
	},
	line_num = {
		use_treesitter = true,
	},
})
