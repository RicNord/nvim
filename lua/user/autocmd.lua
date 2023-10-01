-- Set colorcolumn specifics for filetypes
local group = vim.api.nvim_create_augroup("colorcolumn_options", { clear = true })
vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufAdd" }, {
	group = group,
	callback = function(opts)
		if vim.bo[opts.buf].filetype == "python" then
			vim.opt["colorcolumn"] = "88" -- Black default
		else
			vim.opt["colorcolumn"] = "80"
		end
	end,
    buffer = 1
})
