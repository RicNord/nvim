return {
    {
        dir = vim.fn.stdpath("config"),
        name = "keybindings-help",
        event = "VeryLazy",
        config = function()
            require("config.keybindings_help").setup()
        end,
    },
}
