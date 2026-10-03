return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    cmd = {
        "NvimTreeToggle",
        "NvimTreeFocus",
        "NvimTreeFindFile",
    },
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
    },
    init = function()
        -- Recommended by nvim-tree: disable netrw before it loads
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    opts = {
        experimental = {
            -- Works around a crash on Neovim 0.13 dev builds that report `has("nvim-0.13")`
            -- before the `SessionWritePre` autocmd event they rely on actually exists:
            -- ".../nvim-tree/autocmd.lua:21: Invalid 'event': 'SessionWritePre'"
            -- Safe to remove once either nvim-tree guards this better or your Neovim build
            -- gains `SessionWritePre` (check with `:lua =vim.fn.getcompletion("Session", "event")`).
            session_restore_nvim = false,
        },
        filters = {
            -- Match Telescope's `--hidden` preference: show dotfiles instead of hiding them.
            dotfiles = false,
        },
    },
}
