local align_setup, align = pcall(require, "mini.align")

if not align_setup then
	vim.notify("no align", vim.log.levels.ERROR)
	return
end

align.setup({
	mappings = {
		start = "gl",
		start_with_preview = "gL",
	},
})
