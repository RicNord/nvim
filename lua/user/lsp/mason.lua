local servers = {
	"ansiblels",
	"azure_pipelines_ls",
	"bashls",
	"bicep",
	"clangd",
	"csharp_ls",
	"cssls",
	"docker_compose_language_service",
	"dockerls",
	"dotls",
	"esbonio", -- Sphinx LSP
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"marksman",
	"powershell_es",
	"pyright",
	"ruff",
	"sqlls",
	"taplo",
	"terraformls",
	"yamlls",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	vim.notify("Failed to requier lspconfig")
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
