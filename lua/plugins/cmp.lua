return {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        {
            "L3MON4D3/LuaSnip",
            build = "make install_jsregexp",
            config = function()
                local ls = require("luasnip")

                -- Load VS Code-style snippets after LuaSnip is loaded
                local vs_ls = require("luasnip/loaders/from_vscode")
                vs_ls.lazy_load() -- Snippets

                -- Key mappings for jumping through snippets
                vim.keymap.set({ "i", "s" }, "<C-L>", function()
                    ls.jump(1) -- Jump forward
                end, { silent = true })

                vim.keymap.set({ "i", "s" }, "<C-J>", function()
                    ls.jump(-1) -- Jump back
                end, { silent = true })
            end
        },
    },
    opts = {
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
    },
    config = function()
        local cmp = require("cmp")
        cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        })
        cmp.config.sources({
            { name = "nvim_lua" },
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "path" },
        }, {
            { name = "buffer", keyword_length = 3 },
        })
        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })
    end
}
