local opt = vim.opt -- for conciseness

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

opt.updatetime = 6000

opt.conceallevel = 0 -- so than `` can display in markdown file

opt.backupcopy = "yes" -- inode setting, after vim editing, the inode of file isn't changed.

vim.g.python3_host_prog = "/usr/local/bin/python3"

-- code folding enable
-- opt.foldmethod = "indent"
-- opt.foldmethod = "syntax"
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
opt.foldlevel = 99

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
