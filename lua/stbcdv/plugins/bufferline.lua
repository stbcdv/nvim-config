vim.opt.termguicolors = true
local highlights = require("nord").bufferline.highlights({
	italic = true,
	bold = true,
	fill = "#181c24"
})
require("bufferline").setup{
	options = {
		-- 使用 nvim 内置lsp
		diagnostics = "nvim_lsp",
		separator_style = "slant",
		offsets = {{
			filetype = "NvimTree",
			text = "File Explorer",
			highlight = "Director",
			text_align = "center"
		}},
		close_icon = '',
		buffer_close_icon = '',
		-- indicator = {
		-- 	style = 'underline',
		-- },

		hover = {
			enabled = true,
			delay = 200,
			reveal = {'close'}
		},
		numbers = "ordinal",

	},
	highlights = {
			-- fill = {
				-- fg = { attribute = "fg", highlight = "#ff0000" },
				-- fg = {attribute="fg",highlight="#ff0000"},
				-- bg = { attribute = "bg", highlight = "TabLine" },
			-- },
		-- 	background = {
		-- 		fg = { attribute = "fg", highlight = "TabLine" },
		-- 		bg = { attribute = "bg", highlight = "TabLine" },
		-- 	},
		--
		-- 	buffer_visible = {
		-- 		fg = { attribute = "fg", highlight = "TabLine" },
		-- 		bg = { attribute = "bg", highlight = "TabLine" },
		-- 	},
		--
		-- 	close_button = {
		-- 		fg = { attribute = "fg", highlight = "TabLine" },
		-- 		bg = { attribute = "bg", highlight = "TabLine" },
		-- 	},
		-- 	close_button_visible = {
		-- 		fg = { attribute = "fg", highlight = "TabLine" },
		-- 		bg = { attribute = "bg", highlight = "TabLine" },
		-- 	},
		--
		-- 	tab_selected = {
		-- 		fg = { attribute = "fg", highlight = "Normal" },
		-- 		bg = { attribute = "bg", highlight = "Normal" },
		-- 	},
		-- 	tab = {
		-- 		fg = { attribute = "fg", highlight = "TabLine" },
		-- 		bg = { attribute = "bg", highlight = "TabLine" },
		-- 	},
		-- 	tab_close = {
		-- 		fg = { attribute = "fg", highlight = "TabLineSel" },
		-- 		bg = { attribute = "bg", highlight = "Normal" },
		-- 	},
		--
		-- 	duplicate_selected = {
		-- 		fg = { attribute = "fg", highlight = "TabLineSel" },
		-- 		bg = { attribute = "bg", highlight = "TabLineSel" },
		-- 		underline = true,
		-- 	},
		-- 	duplicate_visible = {
		-- 		fg = { attribute = "fg", highlight = "TabLine" },
		-- 		bg = { attribute = "bg", highlight = "TabLine" },
		-- 		underline = true,
		-- 	},
		-- 	duplicate = {
		-- 		fg = { attribute = "fg", highlight = "TabLine" },
		-- 		bg = { attribute = "bg", highlight = "TabLine" },
		-- 		underline = true,
		-- 	},
		--
		-- 	modified = {
		-- 		fg = { attribute = "fg", highlight = "TabLine" },
		-- 		bg = { attribute = "bg", highlight = "TabLine" },
		-- 	},
		-- 	modified_selected = {
		-- 		fg = { attribute = "fg", highlight = "Normal" },
		-- 		bg = { attribute = "bg", highlight = "Normal" },
		-- 	},
		-- 	modified_visible = {
		-- 		fg = { attribute = "fg", highlight = "TabLine" },
		-- 		bg = { attribute = "bg", highlight = "TabLine" },
		-- 	},
		--
		-- 	separator = {
		-- 		fg = { attribute = "bg", highlight = "TabLine" },
		-- 		bg = { attribute = "bg", highlight = "TabLine" },
		-- 	},
		-- 	separator_selected = {
		-- 		fg = { attribute = "bg", highlight = "Normal" },
		-- 		bg = { attribute = "bg", highlight = "Normal" },
		-- 	},
		-- 	indicator_selected = {
		-- 		fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
		-- 		bg = { attribute = "bg", highlight = "Normal" },
		-- 	},
	},
}
-- 快速在buffer间跳转
vim.api.nvim_set_keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>bg", ":BufferLinePick", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<leader>tn", ":BufferLineCycleNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tp", ":BufferLineCyclePrev<CR>", {noremap = true, silent = true})
--- 配置tabline快捷键，主要以 t开头代表 t
--- 关闭当前标签页
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", {noremap = true, silent = true})
--- 关闭所有标签页，仅保留当前标签页
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", {noremap = true, silent = true})
--- gt 切换到下一个，gT切换到上一个

-- 感觉这才像关闭 tab 标签页
vim.api.nvim_set_keymap("n", "<leader>bc", ":bdelete %<CR>", {noremap = true, silent = true})
-- 关闭除当前的buffer之外的所有buffer
vim.api.nvim_set_keymap("n", "<leader>bo", ":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>", {noremap = true, silent = true})
