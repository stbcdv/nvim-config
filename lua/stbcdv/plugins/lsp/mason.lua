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
    verible,
    -- "flake8",
    -- "python-lsp-server",
		pyright,
		svls,
  },
})
