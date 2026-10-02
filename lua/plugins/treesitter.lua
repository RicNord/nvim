return {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    branch = "main",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-autopairs",
    },
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                -- Enable treesitter highlighting and disable regex syntax
                pcall(vim.treesitter.start)
                -- Enable treesitter-based indentation
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
        local ensureInstalled = {
            "bash",
            "bicep",
            "c",
            "c_sharp",
            "css",
            "diff",
            "dockerfile",
            "go",
            "hcl",
            "helm",
            "html",
            "java",
            "javascript",
            "json",
            "lua",
            "make",
            "markdown",
            "markdown_inline",
            "proto",
            "python",
            "rst",
            "rust",
            "scala",
            "sql",
            "terraform",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
        }
        local alreadyInstalled = require("nvim-treesitter.config").get_installed()
        local parsersToInstall = vim.iter(ensureInstalled)
            :filter(function(parser)
                return not vim.tbl_contains(alreadyInstalled, parser)
            end)
            :totable()
        require("nvim-treesitter").install(parsersToInstall)
    end,
    --config = function()
    --    local configs = require("nvim-treesitter")

    --    configs.setup({
    --        ensure_installed = {
    --            "bash",
    --            "bicep",
    --            "c",
    --            "c_sharp",
    --            "css",
    --            "diff",
    --            "dockerfile",
    --            "go",
    --            "hcl",
    --            "helm",
    --            "html",
    --            "java",
    --            "javascript",
    --            "json",
    --            "lua",
    --            "make",
    --            "markdown",
    --            "markdown_inline",
    --            "proto",
    --            "python",
    --            "rst",
    --            "rust",
    --            "scala",
    --            "sql",
    --            "terraform",
    --            "toml",
    --            "tsx",
    --            "typescript",
    --            "vim",
    --            "vimdoc",
    --            "xml",
    --            "yaml",
    --        },
    --        sync_install = false,
    --        highlight = {
    --            enable = true,
    --            additional_vim_regex_highlighting = false,
    --        },

    --        autopairs = {
    --            enable = true,
    --        },
    --    })
    --end,
}
