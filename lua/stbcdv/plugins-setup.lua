local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- attention:: filename 
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])


local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- use("bluz71/vim-nightfly-guicolors") -- color
	-- https://vimcolorschemes.com/folke/tokyonight.nvim
	use 'folke/tokyonight.nvim'
	use 'shaunsingh/nord.nvim'
	-- use 'navarasu/onedark.nvim'

	use("christoomey/vim-tmux-navigator")

	use("szw/vim-maximizer")

	use("tpope/vim-surround") -- ''""()[]
	use("vim-scripts/ReplaceWithRegister")
	use("nvim-lua/plenary.nvim")
	use 'numToStr/Comment.nvim' -- comment
	use("nvim-tree/nvim-tree.lua") -- just like nerdtree
	use("kyazdani42/nvim-web-devicons")
	-- use( "jiangmiao/auto-pairs" ) -- auto complement '' "" [] ()
	use("nvim-lualine/lualine.nvim") -- status bar

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- need make in his dirctory
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			-- require("plugins.projects")
		end,
	})

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	use("williamboman/mason-lspconfig.nvim")
	use("williamboman/mason.nvim")
	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	-- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- auto-pairs
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- git signs plugins
	use("lewis6991/gitsigns.nvim")
	use("kdheepak/lazygit.nvim")

	use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

	use {'vhda/verilog_systemverilog.vim'}
	-- config dashboard
	use {
		'glepnir/dashboard-nvim',
		-- event = 'VimEnter',
		-- config = function()
		-- 	require("plugins.dashboard_yzx")
		-- end,
		-- config = [[require('plugins.dashboard')]],
		-- require('dashboard').setup {
		-- 	theme = 'hyper', --  theme is doom and hyper default is hyper
		-- disable_move,    --  defualt is false disable move keymap for hyper
		-- shortcut_type,   --  shorcut type 'letter' or 'number'
		-- change_to_vcs_root, -- default is false,for open file in hyper mru. it will change to the root of vcs
		-- config = {
		-- header = 
		-- },--  config used for theme
		--},
		-- }
		-- end,
		-- requires = {'nvim-tree/nvim-web-devicons'}
	}
	use 'lewis6991/impatient.nvim'
	use {
		'mbbill/undotree',
		config = function()
			require("stbcdv.plugins.undotree").config()
		end,
	}
	-- use {
	--  	"jiaoshijie/undotree",
	--  	requires = {
	--    	"nvim-lua/plenary.nvim",
	--  	},
	-- } -- undo list, record what do you do in this file

	if packer_bootstrap then
		require("packer").sync()
	end
end)

