local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

mason.setup()

-- https://github.com/williamboman/mason.nvim/blob/main/PACKAGES.md#python-lsp-server
mason_lspconfig.setup({
	ensure_installed = {
		-- verible,
		-- "flake8",
		-- "python-lsp-server",
		pyright,
		svls,
		lua_ls,
	},
})

-- import mason-null-ls plugin safely
-- local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
-- if not mason_null_ls_status then
-- 	return
-- end
--
-- mason_null_ls.setup({
-- 	-- list of formatters & linters for mason to install
-- 	ensure_installed = {
-- 		"stylua", -- lua formatter
-- 		"autopep8",
-- 	},
-- 	-- auto-install configured formatters & linters (with null-ls)
-- 	automatic_installation = true,
-- })
