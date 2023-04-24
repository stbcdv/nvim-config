local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-`>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-`><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-`><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-`><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-`><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-`><C-n><C-W>l]], opts)
	-- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-`><C-n>]], opts)  -- 这个在 lazygit 中有点不好用, 向下选择会有延迟
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

local function feedkeys(keys)
	local key_termcode = vim.api.nvim_replace_termcodes(keys, true, true, true)
	vim.api.nvim_feedkeys(key_termcode, "n", false)
end

-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
-- local cur_cwd = vim.fn.getcwd()

-- function _LAZYGIT_TOGGLE()
-- 	-- cwd is the root of project. if cwd is changed, change the git.
-- 	local cwd = vim.fn.getcwd()
-- 	if cwd ~= cur_cwd then
-- 		cur_cwd = cwd
-- 		lazygit:close()
-- 		lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
-- 	end
-- 	lazygit:toggle()
-- end

function _LAZYGIT_TOGGLE()
	lazygit.dir = vim.fn.expand("%:p:h") -- current working directory for the active buffer
	lazygit:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true }) -- can change cmd = "top" to cmd = "htop"
function _HTOP_TOGGLE()
	htop:toggle()
end

local python = Terminal:new({ cmd = "python3", hidden = true })
function _PYTHON_TOGGLE()
	python:toggle()
end

local broot = Terminal:new({ cmd = "broot -d -p -s", hidden = true }) -- file explore
function _BROOT_TOGGLE()
	-- local cwd = vim.fn.getcwd()
	-- if cwd ~= cur_cwd then
	-- 	cur_cwd = cwd
	-- 	broot:close()
	-- 	broot = Terminal:new({ cmd = "broot -d -p -s", hidden = true }) -- file explore
	-- end
	broot.dir = vim.fn.expand("%:p:h") -- current working directory for the active buffer
	broot:toggle()
end

local ranger_tmpfile = vim.fn.tempname()
local ranger = Terminal:new({
	cmd = 'ranger --choosefiles="' .. ranger_tmpfile .. '"',
	hidden = true,
	on_exit = function(term)
		local file = io.open(ranger_tmpfile, "r")
		if file ~= nil then
			local file_name = file:read("*a")
			file:close()
			os.remove(ranger_tmpfile)
			-- Until edit buffer goes to the correct buffer,
			-- emulate keystrokes to do the same
			vim.cmd("vs " .. file_name)
			vim.cmd("set nu") -- 必须有这些，否则重新打开的窗口有些配置不起作用
			vim.cmd("set relativenumber")
			feedkeys("<C-w>h")
			feedkeys("<C-w>q")
		end
	end,
})
function _RANGER_TOGGLE()
	-- local cwd = vim.fn.getcwd()
	-- if cwd ~= cur_cwd then
	-- 	cur_cwd = cwd
	-- 	ranger:close()
	-- 	ranger = Terminal:new({
	-- 		cmd = 'ranger --choosefiles="' .. ranger_tmpfile .. '"',
	-- 		hidden = true,
	-- 		on_exit = function(term)
	-- 			local file = io.open(ranger_tmpfile, "r")
	-- 			if file ~= nil then
	-- 				local file_name = file:read("*a")
	-- 				file:close()
	-- 				os.remove(ranger_tmpfile)
	-- 				-- Until edit buffer goes to the correct buffer,
	-- 				-- emulate keystrokes to do the same
	-- 				vim.cmd("vs " .. file_name)
	-- 				vim.cmd("set nu") -- 必须有这些，否则重新打开的窗口有些配置不起作用
	-- 				vim.cmd("set relativenumber")
	-- 				feedkeys("<C-w>h")
	-- 				feedkeys("<C-w>q")
	-- 			end
	-- 		end,
	-- 	})
	-- end
	ranger.dir = vim.fn.expand("%:p:h") -- current working directory for the active buffer
	ranger:toggle()
end

-- local node = Terminal:new({ cmd = "node", hidden = true })
-- function _NODE_TOGGLE()
-- 	node:toggle()
-- end

-- local ncdu = Terminal:new({ cmd = "ncdu --sort name", hidden = true }) -- file explore
-- function _NCDU_TOGGLE()
-- 	ncdu:toggle()
-- end
