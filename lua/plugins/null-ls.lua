return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting

        return {
            debug = false,
            sources = {
                -- Lua
                formatting.stylua,
                formatting.markdownlint.with({
                    extra_args = {
                        "--config",
                        "~/.formatting/.markdownlint.jsonc",
                    },
                }),
                -- Bash
                formatting.shfmt.with({
                    extra_args = {
                        "-i", "4", -- indent 4 spaces
                        "-bn",     -- allow binary ops like && and | to start line
                        "-ci",     -- indent switch cases
                    },
                }),
                -- Yaml
                formatting.yamlfmt,
            },
        }
    end,
    --    config = function(_, opts)
    --        local null_ls = require("null-ls")
    --        null_ls.setup(opts)
    --
    --        -- Use internal formatting for bindings like gq
    --        vim.api.nvim_create_autocmd("LspAttach", {
    --            callback = function(args)
    --                vim.bo[args.buf].formatexpr = nil
    --            end,
    --        })
    --    end,
}
