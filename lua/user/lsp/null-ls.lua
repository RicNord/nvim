local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	vim.notify("Failed to requier null-ls")
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- Python
		formatting.black,
		formatting.isort,
		diagnostics.flake8.with({
			extra_args = {
				"--extend-ignore",
				"E501", -- line too long
			},
		}),
		-- Lua
		formatting.stylua,
		-- Bash
		diagnostics.shellcheck,
		formatting.shfmt.with({
			extra_args = {
				"-i",
				"4", -- indent 4 spaces
				"-bn", -- allow binary ops like && and | to start line
				"-ci", -- indent switch cases
			},
		}),
		---- Terraform
		--diagnostics.terraform_validate,
		--formatting.terraform_fmt,
		---- Yaml
		formatting.yamlfmt,
		--diagnostics.yamllint,
		---- SQL
		--formatting.sqlfluff,
		--diagnostics.sqlfluff,
		---- JavaScript
		--formatting.prettier,
		---- Scala
		--formatting.scalafmt
	},
})
