local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
	vim.notify("Failed to require luasnip")
	return
end

local vs_snip_status_ok, vs_ls = pcall(require, "luasnip/loaders/from_vscode")
if not vs_snip_status_ok then
	vim.notify("Failed to require luasnip/loaders/from_vscode")
else
	vs_ls.lazy_load() -- Snippets
end

vim.keymap.set({ "i", "s" }, "<C-L>", function()
	ls.jump(1)
end, { silent = true }) -- Jump forward
vim.keymap.set({ "i", "s" }, "<C-J>", function()
	ls.jump(-1)
end, { silent = true }) -- Jump Back
