-- Use internal formatting for bindings like gq.
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        vim.bo[args.buf].formatexpr = nil
    end,
})

-- Set colorcolumn specifics for filetypes
--local group = vim.api.nvim_create_augroup("colorcolumn_options", { clear = true })
--vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufAdd" }, {
--	group = group,
--	callback = function(opts)
--		if vim.bo[opts.buf].filetype == "python" then
--			vim.opt["colorcolumn"] = "88" -- Black default
--		else
--			vim.opt["colorcolumn"] = "80"
--		end
--	end,
--    buffer = 0
--})
