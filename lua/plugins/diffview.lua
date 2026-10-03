return {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose", "DiffviewToggleFiles", "DiffviewRefresh" },
    keys = {
        { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview: open diff for working tree" },
        { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: file history for current file" },
    },
}
