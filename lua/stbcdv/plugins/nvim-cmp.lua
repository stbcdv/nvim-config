-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	vim.notify("no cmp", vim.log.levels.ERROR)
	return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
local i = luasnip.insert_node
local s = luasnip.snippet
local t = luasnip.text_node
local f = luasnip.function_node
if not luasnip_status then
	vim.notify("no cmp", vim.log.levels.ERROR)
	return
end
-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip.loaders.from_vscode").load({
	include = { "c", "python", "json", "lua", "markdown", "verilog", "systemverilog", "sh", "make" },
})
-- require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.expand("~/.config/nvim/my_snippets") } })

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	vim.notify("no lspkind", vim.log.levels.ERROR)
	return
end
-- tab list icon
lspkind.init({
	mode = "symbol_text",
	preset = "codicons",
	symbol_map = {
		Text = "",
		Method = "M",
		Function = "󰊕",
		Constructor = "",
		Field = "",
		Variable = "",
		Class = "",
		Interface = "",
		Module = "",
		Property = "",
		Unit = "",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "",
		Event = "",
		Operator = "",
		TypeParameter = "",
	},
})
-- file icon setting, also can override_by_filename and override_by_extension by using different function, see more infomation in Readme
-- require("nvim-web-devicons").set_icon {
--   zsh = {
--     icon = "",
--     color = "#428850",
--     cterm_color = "65",
--     name = "Zsh"
--   }
-- }

vim.opt.completeopt = "menu,menuone,noselect"
local select_opts = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<Up>"] = cmp.mapping.select_prev_item(select_opts),
		["<Down>"] = cmp.mapping.select_next_item(select_opts),
		["<C-k>"] = cmp.mapping.select_prev_item(select_opts), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(select_opts), -- next suggestion
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),

		["<Tab>"] = cmp.mapping(function(fallback) -- 出现可选框后按tab向下选择
			local col = vim.fn.col(".") - 1
			if cmp.visible() then
				cmp.select_next_item(select_opts)
			elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
				fallback()
			else
				cmp.complete()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback) -- 出现可选框后按tab向下选择
			if cmp.visible() then
				cmp.select_prev_item(select_opts)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-f>"] = cmp.mapping(
			function(fallback) -- 跳转到下一个代码参数，注意必须在插入模式中跳转，在普通模式则是另外一种现象
				if luasnip.jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end,
			{ "i", "s" }
		),

		["<C-b>"] = cmp.mapping(function(fallback) -- 跳转到上一个代码参数
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},

	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp
		{ name = "luasnip" }, -- snippets
		{ name = "path" }, -- file system paths
		{ name = "nvim_lua" },
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		}, -- text within current buffer
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		format = lspkind.cmp_format({
			with_text = false,
			mode = "symbol_text",
			maxwidth = 50,
			ellipsis_char = "...",
			menu = {
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				buffer = "[Buffer]",
				luasnip = "[LuaSnip]",
				treesitter = "[TS]",
			},
		}),
	},
})

luasnip.add_snippets("systemverilog", {
	s({ trig = "sformatf", dscr = "System method: strings output" }, {
		t('$sformatf("'),
		i(1, "strings"),
		t('",'),
		i(2, "%s"),
		t(")"),
	}),
})
