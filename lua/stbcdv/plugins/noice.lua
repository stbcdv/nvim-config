local noice_status, noice = pcall(require, "noice")
if not noice_status then
	vim.notify("no noice", vim.log.levels.ERROR)
	return
end

-- local notify_status, notify = pcall(require, "noice")
-- if not notify_status then
-- 	vim.notify("no notify", vim.log.levels.ERROR)
-- 	return
-- end

-- notify.setup({
-- 	render = "compact",
-- 	stages = "slide",
-- })

noice.setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
	views = {
		cmdline_popup = {
			position = {
				row = 5,
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
			},
		},
		popupmenu = {
			relative = "editor",
			position = {
				row = 8,
				col = "50%",
			},
			size = {
				width = 60,
				height = 10,
			},
			border = {
				style = "rounded",
				padding = { 0, 1 },
			},
			win_options = {
				winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
			},
		},
	},
	routes = {
		{
			filter = {
				event = { "msg_show" },
				kind = "",
				find = "%d+ 行",
			},
			opts = { title = "Error", skip = true },
		},
		{
			filter = {
				event = { "msg_show" },
				kind = "",
				find = "%d+ line",
			},
			opts = { title = "Error", skip = true },
		},
		{
			filter = {
				event = "msg_show",
				kind = "",
				find = "%d+ line",
			},
			opts = { title = "Error", skip = true },
		},
		{
			filter = {
				event = "msg_show",
				kind = "",
				find = "已写入",
			},
			opts = { title = "Error", skip = true },
		},
		{
			filter = {
				event = "msg_show",
				kind = "",
				find = "发生改变",
			},
			opts = { title = "Error", skip = true },
		},
		{
			filter = {
				event = "notify",
				-- kind = "hlchunk.chunk",
				find = "no parser for",
			},
			opts = { title = "Notify", skip = true },
		},
	},
})
