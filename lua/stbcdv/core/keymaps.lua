vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("n", "<leader>w", "<cmd>w<CR>") -- 保存文件, 个人觉得应该没有其他的键会被占用
keymap.set("n", "p", '""p') -- 保存文件, 个人觉得应该没有其他的键会被占用

keymap.set("i", "jk", "<ESC>") -- in insert mode, then jk to esc
-- keymap.set("v", "jk", "<ESC>") -- in insert mode, then jk to esc

keymap.set("n", "<leader>nh", "<cmd>nohl<CR>") -- search then normal, space and nh

keymap.set("n", "<C-u>", "9k") -- 向上移动9行

keymap.set("n", "<C-d>", "9j") -- 向下移动9行

keymap.set("n", "x", '"_x"')
-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- windows manage
keymap.set("n", "<leader>sv", "<C-w>v") -- 垂直分割
keymap.set("n", "<leader>sh", "<C-w>s") -- 水平分割
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>ta", ":tabnew<CR>") --.open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab 关闭当前标签页
keymap.set("n", "<leader>cx", "<cmd>close<CR>") -- 关闭当前编辑的文件页
-- keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- vim-maximizer
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>") -- 最大化当前的session

-- nerd-tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- theme=dropdown
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
keymap.set("n", "<leader>fa", "<cmd>Telescope command_history<cr>")
keymap.set("n", "<leader>ft", "<cmd>Telescope tags<cr>")
keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>")
keymap.set("n", "<leader>fv", '<cmd>Telescope neoclip " <cr>')

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- toggleterm.nvim keymaps
-- keymap.set("n","<leader>lg", "<cmd>LazyGit<cr>") -- 属于 lazygit.nvim
keymap.set("n", "<leader>lg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>") -- belongs to toggleterm.nvim
keymap.set("n", "<leader>py", "<cmd>lua _PYTHON_TOGGLE()<cr>") -- belongs to toggleterm.nvim
keymap.set("n", "<leader>br", "<cmd>lua _BROOT_TOGGLE()<cr>") -- belongs to toggleterm.nvim
keymap.set("n", "<leader>ht", "<cmd>lua _HTOP_TOGGLE()<cr>") -- belongs to toggleterm.nvim
keymap.set("n", "<leader>rg", "<cmd>lua _RANGER_TOGGLE()<cr>") -- belongs to toggleterm.nvim
-- keymap.set("n", "<leader>T", "<cmd>ToggleTerm<CR>") -- belongs to toggleterm.nvim
-- vim.api.nvim_set_keymap("", "<leader>aa", "<cmd>execute  v:count . \"ToggleTerm dir='%:p:h'\"<CR>", {})keykeykey

-- undotree keymaps
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
-- Tagbar keymaps
keymap.set("n", "<leader>tg", "<cmd>TagbarToggle<cr>")

-- vim.cmd([[
-- let g:VM_maps = {}
-- let g:VM_default_mappings = 0
-- let g:VM_silent_exit = 1
-- let g:VM_set_statusline = 0
-- let g:VM_maps['Find Under']            = '<C-n>'
-- let g:VM_maps['Find Subword Under']    = '<C-n>'
-- let g:VM_maps["Select Cursor Down"]    = '<C-A-Down>'
-- let g:VM_maps["Add Cursor Down"]    	= '<C-Down>'
-- let g:VM_maps["Select Cursor Up"]      = '<C-A-Up>'
-- let g:VM_maps["Add Cursor up"] 	   	= '<C-Up>'
-- let g:VM_maps["Find Next"]             = ']'
-- let g:VM_maps["Find Prev"]             = '['
-- let g:VM_maps["Goto Next"]             = '}'
-- let g:VM_maps["Goto Prev"]             = '{'
-- ]])
