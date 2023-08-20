local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
	vim.notify("no illuminate", vim.log.levels.ERROR)
	return
end
illuminate.configure({
	providers = {
		-- "lsp",
		"treesitter",
		"regex",
	},
	modes_denylist = { "i" },
	filetypes_denylist = {
		"dirvish",
		"fugitive",
		"toggleterm",
		"NvimTree",
		"dashboard",
		"undotree",
		"TelescopePrompt",
		"mason",
		"packer",
		"tagbar",
	},
	Illuminate_ftwhitelist = { "vim", "sh", "python", "sv", "svh", "c" },
	under_cursor = true,
})
-- surface2 = "#acb0be"
-- surface1 = "#bcc0cc"
-- surface0 = "#ccd0da"
-- foreground = "#dadada"
-- cursorline = "#2c3333"
vim.api.nvim_command([[ hi illuminatedWord cterm=undercurl gui=underline ]])
vim.api.nvim_command([[ hi illuminatedWordText cterm=underline gui=underline ]])
vim.api.nvim_command([[ hi IlluminatedWordRead cterm=underline gui=underline guibg=surface2 ]])
vim.api.nvim_command([[ hi IlluminatedWordWrite cterm=underline gui=underline ]])
