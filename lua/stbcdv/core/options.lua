local opt = vim.opt -- for conciseness
local g = vim.g

-- line numbers
opt.relativenumber = true
opt.number = true
opt.ruler = true

-- tabs & indentation
opt.tabstop = 3
opt.shiftwidth = 3
opt.expandtab = false -- tab 不转换为空格
opt.autoindent = true

-- line wrapping
opt.wrap = true

-- search setting
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true
opt.cursorcolumn = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- my setting
opt.mouse = "a"
opt.mousemoveevent = true
opt.fileencoding = "utf-8"

-- 显示缩进线 enter为eol = '⤶',
vim.opt.listchars = { trail = "✚", extends = "◀", precedes = "▶", space = "_", tab = "|~", eol = "⤶" }
vim.opt.list = true

opt.updatetime = 6000 -- interval for writing swap file to disk, also used by gitsigns
opt.backupcopy = "yes" -- inode setting, after vim editing, the inode of file isn't changed. but ban the swap file generate, you must save now, when some reasons make the modify disappear

opt.conceallevel = 0 -- so than `` can display in markdown file

g.python3_host_prog = "/usr/local/bin/python3"

-- code folding enable
-- opt.foldmethod = "indent"
-- opt.foldmethod = "syntax"
opt.foldenable = false
opt.foldlevel = 99

-- ctags setting, about tagbar
local kinds = {
	"A:assertions",
	"C:classes",
	"E:enumerators",
	"I:interfaces",
	"K:packages",
	"M:modports",
	"P:programs",
	"Q:prototypes",
	"R:properties",
	"S:structs and unions",
	"T:type declarations",
	"V:covergroups",
	"b:blocks",
	"c:constants",
	"e:events",
	"f:functions",
	"m:modules",
	"n:net data types",
	-- "p:ports",
	"r:register data types",
	"t:tasks",
}
g.tagbar_type_systemverilog = {
	ctagstype = "systemverilog",
	kinds = kinds,
	sro = ".",
	kind2scope = {
		K = "package",
		C = "class",
		m = "module",
		P = "program",
		I = "interface",
		M = "modport",
		f = "function",
		t = "task",
	},
	scope2kind = {
		package = "K",
		class = "C",
		module = "m",
		program = "P",
		interface = "I",
		modport = "M",
		func = "f",
		task = "t",
	},
}
g.tagbar_autofocus = 1 -- tagbar open, the cursor is in tagbar windows
g.tagbar_sort = 0 -- sort by the order in the source
-- g.toggle_theme_icon = "   "

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- command history
opt.history = 100

opt.termguicolors = true
-- 下面的函数是为了打开一个文件后自动打开所有的折叠，但是我好像不需要
-- local api = vim.api
-- local M = {}
-- function to create a list of commands and convert them to autocommands
-------- This function is taken from https://github.com/norcalli/nvim_utils
-- function M.nvim_create_augroups(definitions)
-- 	for group_name, definition in pairs(definitions) do
-- 		api.nvim_command("augroup " .. group_name)
-- 		api.nvim_command("autocmd!")
-- 		for _, def in ipairs(definition) do
-- 			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
-- 			api.nvim_command(command)
-- 		end
-- 		api.nvim_command("augroup END")
-- 	end
-- end

-- local autoCommands = {
-- 	-- other autocommands
-- 	open_folds = {
-- 		{ "BufReadPost,FileReadPost", "*", "normal zR" },
-- 	},
-- }

-- M.nvim_create_augroups(autoCommands)

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "systemverilog",
-- 	callback = function()
-- 		vim.api.nvim_command("set filetype=verilog_systemverilog")
-- 		vim.api.nvim_command("setfiletype verilog_systemverilog")
-- 	end,
-- })
-- vim.cmd([[
-- 	augroup systemverilog_tile
-- 	autocmd!
-- 	autocmd FileType *.sv : setfiletype verilog_systemverilog
-- 	augroup end
-- ]])
