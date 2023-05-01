local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
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
	-- improve the effection, it is recommand putting this in front of other plugins
	use("lewis6991/impatient.nvim")
	-- plugins manager
	use("wbthomason/packer.nvim")
	-- theme
	-- use("bluz71/vim-nightfly-guicolors") -- color
	use("folke/tokyonight.nvim")
	-- use 'shaunsingh/nord.nvim'
	-- use("navarasu/onedark.nvim")
	-- language syntax
	-- systemverilog syntax
	-- use 'nachumk/systemverilog.vim'
	use({ "vhda/verilog_systemverilog.vim" })
	-- windows manager
	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer")
	use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })

	use("tpope/vim-surround") -- ''""()[]
	-- use("vim-scripts/ReplaceWithRegister")
	use("nvim-lua/plenary.nvim")
	use("numToStr/Comment.nvim") -- comment
	use("nvim-tree/nvim-tree.lua") -- just like nerdtree
	use("kyazdani42/nvim-web-devicons")

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- need make in his dirctory
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use({ "ahmedkhalf/project.nvim" })
	-- clipboard manager
	use({ "AckslD/nvim-neoclip.lua", requires = {
		{ "kkharji/sqlite.lua", module = "sqlite" },
	} })

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	-- auto-pairs
	use("windwp/nvim-autopairs")
	-- use( "jiangmiao/auto-pairs" ) -- auto complement '' "" [] ()
	-- use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	use("williamboman/mason-lspconfig.nvim")
	use("williamboman/mason.nvim")
	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = { { "nvim-tree/nvim-web-devicons" }, { "nvim-treesitter" } },
	}) -- enhanced lsp uis
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- git signs plugins
	use("lewis6991/gitsigns.nvim")
	-- use("kdheepak/lazygit.nvim")
	-- config dashboard
	use({ "glepnir/dashboard-nvim" })
	-- status bar
	use("nvim-lualine/lualine.nvim")
	-- file editings history
	use({
		"mbbill/undotree",
		config = function()
			require("stbcdv.plugins.undotree").config()
		end,
	})
	-- iTerm tool
	use({ "akinsho/toggleterm.nvim" })
	-- variable, method class list
	use({ "preservim/tagbar" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
