return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim", -- Required for Telescope
    },
    config = function()
        -- Telescope setup configuration
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local telescopeConfig = require("telescope.config")

        -- Clone the default Telescope configuration
        local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

        -- Modify search arguments
        table.insert(vimgrep_arguments, "--hidden")
        table.insert(vimgrep_arguments, "--glob")
        table.insert(vimgrep_arguments, "!**/{.git,.terraform}/*")

        telescope.setup({
            defaults = {
                vimgrep_arguments = vimgrep_arguments,
            },
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/{.git,.terraform}/*" },
                },
            },
        })

        -- Key mappings for Telescope commands
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    end,
}
