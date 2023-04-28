vim.opt.termguicolors = true
-- local icons = require("stbcdv.plugins.icons")
local function diagnostics_indicator(num, _, diagnostics, _)
	local result = {}
	local symbols = {
		error = "",
		warning = "",
		info = "",
	}
	-- if not lvim.use_icons then
	--   return "(" .. num .. ")"
	-- end
	for name, count in pairs(diagnostics) do
		if symbols[name] and count > 0 then
			table.insert(result, symbols[name] .. " " .. count)
		end
	end
	result = table.concat(result, " ")
	return #result > 0 and result or ""
end

local function is_ft(b, ft)
	return vim.bo[b].filetype == ft
end

-- NOTE: this will be called a lot so don't do any heavy processing here
local function custom_filter(buf, buf_nums)
	local logs = vim.tbl_filter(function(b)
		return is_ft(b, "log")
	end, buf_nums or {})
	if vim.tbl_isempty(logs) then
		return true
	end
	local tab_num = vim.fn.tabpagenr()
	local last_tab = vim.fn.tabpagenr("$")
	local is_log = is_ft(buf, "log")
	if last_tab == 1 then
		return true
	end
	-- only show log buffers in secondary tabs
	return (tab_num == last_tab and is_log) or (tab_num ~= last_tab and not is_log)
end

local bufferline_status, bufferline = pcall(require, "bufferline")
if not bufferline_status then
	vim.notify("no bufferline", vim.log.levels.ERROR)
	return
end
bufferline.setup({
	options = {
		-- 使用 nvim 内置lsp
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = diagnostics_indicator,
		custom_filter = custom_filter,
		mode = "buffers",
		sort_by = "id", -- "insert_after_current"
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Director",
				text_align = "center",
			},
			{
				text = "UNDOTREE",
				filetype = "undotree",
				highlight = "PanelHeading",
				separator = true,
			},
		},
		close_icon = "",
		buffer_close_icon = "",
		separator_style = "thin", -- slant 有时并不是很完美，则使用 padded_slant, :h bufferline-styling
		indicator = {
			icon = "▎", -- this should be omitted if indicator style is not 'icon'
			style = "icon", -- can also be 'underline'|'none',
		},
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		numbers = "ordinal",
		name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
			-- remove extension from markdown files for example readme.md -> readme
			if buf.name:match("%.md") or buf.name:match("%.txt") then
				return vim.fn.fnamemodify(buf.name, ":t:r")
			end
		end,
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		truncate_names = true, -- whether or not tab names should be truncated
		tab_size = 18,
	},
	highlights = {
		background = {
			italic = true,
		},
		buffer_selected = {
			bold = true,
		},
	},
})
-- 快速在buffer间跳转
vim.api.nvim_set_keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bg", ":BufferLinePick<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>tn", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
--- 配置tabline快捷键，主要以 t开头代表 t
--- 关闭当前标签页
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true })
--- 关闭所有标签页，仅保留当前标签页
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true, silent = true })
--- gt 切换到下一个，gT切换到上一个

-- 感觉这才像关闭 tab 标签页
vim.api.nvim_set_keymap("n", "<leader>bc", ":bdelete %<CR>", { noremap = true, silent = true })
-- 关闭除当前的buffer之外的所有buffer
vim.api.nvim_set_keymap(
	"n",
	"<leader>bo",
	":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>",
	{ noremap = true, silent = true }
)
