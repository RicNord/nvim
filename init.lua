require("config.lazy")

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
