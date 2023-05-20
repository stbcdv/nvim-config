-- import nvim-autopairs safely
local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
	vim.notify("no autopairs", vim.log.levels.ERROR)
	return
end

-- configure autopairs
autopairs.setup({
	check_ts = true, -- enable treesitter
	ts_config = {
		lua = { "string" }, -- don't add pairs in lua string treesitter nodes
		-- javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
		-- java = false, -- don't check treesitter on java
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
	enable_moveright = true,
	---@usage disable when recording or executing a macro
	disable_in_macro = false,
	---@usage add bracket pairs after quote
	enable_afterquote = true,
	---@usage map the <BS> key
	map_bs = true,
	---@usage map <c-w> to delete a pair if possible
	map_c_w = false,
	---@usage disable when insert after visual block mode
	disable_in_visualblock = false,
	fast_wrap = {
		map = "<M-e>", -- <M> 代表这 Meta 键，即option(mac)，win(windous)
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
	enable_check_bracket_line = false,
})

-- import nvim-autopairs completion functionality safely
local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_setup then
	vim.notify("no cmp_autopairs", vim.log.levels.ERROR)
	return
end

-- import nvim-cmp plugin safely (completions plugin)
local cmp = require("cmp")

-- make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
