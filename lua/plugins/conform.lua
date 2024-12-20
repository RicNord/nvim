return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<space>f",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { "stylua" },
            yaml = { "yamlfmt" },
            markdown = { "markdownlint" },
            sh = { "shfmt" },
        },
        -- Set default options
        default_format_opts = {
            lsp_format = "fallback",
        },
        -- Customize formatters
        formatters = {
            shfmt = {
                prepend_args = {
                    "-i",
                    "4", -- indent 4 spaces
                    "-bn", -- allow binary ops like && and | to start line
                    "-ci", -- indent switch cases
                },
            },
        },
    },
}
