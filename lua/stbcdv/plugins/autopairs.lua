-- import nvim-autopairs safely
local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }

if not autopairs_setup then
	vim.notify("no autopairs", vim.log.levels.ERROR)
	return
end

-- configure autopairs
autopairs.setup({
	check_ts = true, -- enable treesitter
	ts_config = {
		lua = { "string" }, -- don't add pairs in lua string treesitter nodes
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
	enable_check_bracket_line = true,
})

-- add rules
autopairs.add_rules({
	-- add spaces between parantheses
	Rule(" ", " "):with_pair(function(opts)
		local pair = opts.line:sub(opts.col - 1, opts.col)
		return vim.tbl_contains({
			brackets[1][1] .. brackets[1][2],
			brackets[2][1] .. brackets[2][2],
			brackets[3][1] .. brackets[3][2],
		}, pair)
	end),
	-- auto add space on =
	Rule("=", "", { "c", "verilog", "systemverilog", "matlab", "python", "perl", "lua" })
		:with_pair(cond.not_inside_quote())
		:with_pair(function(opts)
			local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
			if last_char:match("[%w%=%s]") then
				return true
			end
			return false
		end)
		:replace_endpair(function(opts)
			local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
			local next_char = opts.line:sub(opts.col, opts.col)
			next_char = next_char == " " and "" or " "
			if prev_2char:match("%w$") then
				return "<bs> =" .. next_char
			end
			if prev_2char:match("%=$") then
				return next_char
			end
			if prev_2char:match("=") then
				return "<bs><bs>=" .. next_char
			end
			return ""
		end)
		:set_end_pair_length(0)
		:with_move(cond.none())
		:with_del(cond.none()),
})
for _, bracket in pairs(brackets) do
	autopairs.add_rules({
		Rule(bracket[1] .. " ", " " .. bracket[2])
			:with_pair(function()
				return false
			end)
			:with_move(function(opts)
				return opts.prev_char:match(".%" .. bracket[2]) ~= nil
			end)
			:use_key(bracket[2]),
	})
end
-- Move past commas and semicolons, 有点看不明白
for _, punct in pairs({ ",", ";" }) do
	autopairs.add_rules({
		Rule("", punct)
			:with_move(function(opts)
				return opts.char == punct
			end)
			:with_pair(function()
				return false
			end)
			:with_del(function()
				return false
			end)
			:with_cr(function()
				return false
			end)
			:use_key(punct),
	})
end

autopairs.remove_rule("`")
autopairs.add_rules({
	Rule("`", "`", { "markdown" }):with_pair(cond.done()),
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
