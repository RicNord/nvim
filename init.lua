-- Check if running vscode extension or not
-- https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim
if vim.g.vscode then
	-- VSCode extension
else
	-- ordinary Neovim
	require("user.options")
	require("user.keymaps")
	require("user.plugins")
	require("user.colorscheme")
	require("user.cmp")
	require("user.lsp")
	require("user.telescope")
	require("user.gitsigns")
	require("user.treesitter")
	require("user.autopairs")
	require("user.undotree")
	require("user.autocmd")
end

-- See `:h clipboard-wsl`
local in_wsl = os.getenv("WSL_DISTRO_NAME") ~= nil
if in_wsl then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = { "clip.exe" },
			["*"] = { "clip.exe" },
		},
		paste = {
			["+"] = { "wsl-paste" },
			["*"] = { "wsl-paste" },
		},
		cache_enabled = 0,
	}
end
