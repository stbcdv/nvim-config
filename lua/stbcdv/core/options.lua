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

-- opt.syntax = rue

-- my setting
opt.mouse = "a"
opt.mousemoveevent = true
opt.fileencoding = "utf-8"

-- 显示缩进线 enter为eol = '⤶',
vim.opt.listchars = { trail = "✚", extends = "◀", precedes = "▶", space = "_", tab = "|~", eol = "⤶" }
vim.opt.list = true

opt.foldmethod = "indent"
opt.foldmethod = "syntax"
opt.foldenable = false

opt.updatetime = 6000

opt.conceallevel = 0 -- so than `` can display in markdown file

-- let g:python3_host_prog = '/usr/local/bin/python3' writre instead by lua
vim.g.python3_host_prog = "/usr/local/bin/python3"
