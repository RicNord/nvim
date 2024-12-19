require("config.lazy")

--require("user.options")
--require("user.keymaps")
--require("user.plugins")
--require("user.colorscheme")
--require("user.luasnip")
--require("user.cmp")
--require("user.lsp")
--require("user.telescope")
--require("user.gitsigns")
--require("user.treesitter")
--require("user.autopairs")
--require("user.autocmd")
--require("user.rooter")
--require("user.find_and_replace_multi")

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
