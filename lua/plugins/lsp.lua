return {
  -- Mason for managing external tools and LSP servers
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup {
        ui = { border = "rounded" },
      }
    end,
  },
    -- Mason LSPConfig for integrating Mason with nvim-lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            local lsp = {
                "ansiblels",
                "bashls",
                "bicep",
                "clangd",
                "csharp_ls",
                "cssls",
                "docker_compose_language_service",
                "dockerls",
                "dotls",
                "esbonio", -- Sphinx LSP
                "gopls",
                "html",
                "jsonls",
                "lua_ls",
                "marksman",
                "powershell_es",
                "pyright",
                "ruff",
                "sqlls",
                "taplo",
                "terraformls",
                "yamlls",
            }
            require("mason-lspconfig").setup {
                ensure_installed = lsp,
                automatic_installation = true,
            }
        end,
    },

    -- nvim-lspconfig for configuring LSP servers
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            -- LSP log level
            vim.lsp.set_log_level("OFF") -- Turn on when debugging

            -- LSP capabilities
            local capabilities = cmp_nvim_lsp.default_capabilities()

            -- Diagnostics configuration
            vim.diagnostic.config {
                virtual_text = { source = "if_many" },
                float = {
                    scope = "line",
                },
            }

            -- LSP key mappings
            local function lsp_keymaps(bufnr)
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
                vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
                vim.keymap.set("n", "<space>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, bufopts)
                vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set("n", "<space>f", function()
                    vim.lsp.buf.format({ async = true })
                end, bufopts)
            end

            -- On_attach function
            local function on_attach(client, bufnr)
                if client.name == "ruff" then
                    client.server_capabilities.hoverProvider = false -- Disable hover in favor of Pyright
                end
                lsp_keymaps(bufnr)
            end

            -- LSP server configurations
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim" } },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            telemetry = { enable = false },
                        },
                    },
                },
                pyright = {
                    setting = {
                        pyright = {
                            -- Using Ruff's import organizer
                            disableOrganizeImports = true,
                        },
                    },
                },
            }

            for server, config in pairs(servers) do
                config.capabilities = capabilities
                config.on_attach = on_attach
                lspconfig[server].setup(config)
            end
        end,
    },
}
