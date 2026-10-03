return {
    "nickjvandyke/opencode.nvim",
    config = function()
        local opencode_term = {
            buf = nil,
            win = nil,
        }

        -- Show the OpenCode terminal, creating it on first use and reusing it
        -- afterward so the TUI/session keeps running in the background while hidden.
        local function show_opencode_terminal(focus)
            if opencode_term.win and vim.api.nvim_win_is_valid(opencode_term.win) then
                if focus then
                    vim.api.nvim_set_current_win(opencode_term.win)
                end
                return
            end

            local prev_win = vim.api.nvim_get_current_win()
            local buf_is_valid = opencode_term.buf and vim.api.nvim_buf_is_valid(opencode_term.buf)

            vim.cmd("vsplit")
            opencode_term.win = vim.api.nvim_get_current_win()

            if buf_is_valid then
                vim.api.nvim_win_set_buf(opencode_term.win, opencode_term.buf)
            else
                vim.cmd("terminal opencode")
                opencode_term.buf = vim.api.nvim_get_current_buf()
            end

            if focus then
                vim.cmd("startinsert")
            else
                vim.api.nvim_set_current_win(prev_win)
            end
        end

        local function hide_opencode_terminal()
            if opencode_term.win and vim.api.nvim_win_is_valid(opencode_term.win) then
                pcall(vim.api.nvim_win_close, opencode_term.win, false)
            end
            opencode_term.win = nil
        end

        local function toggle_opencode_terminal()
            if opencode_term.win and vim.api.nvim_win_is_valid(opencode_term.win) then
                hide_opencode_terminal()
            else
                show_opencode_terminal(true)
            end
        end

        ---@type opencode.Opts
        vim.g.opencode_opts = {
            server = {
                -- Reuse the same managed terminal instead of opencode.nvim's
                -- default `vsplit term://opencode | wincmd p`.
                start = function()
                    show_opencode_terminal(false)
                end,
            },
        }

        -- Toggle a persistent OpenCode TUI terminal
        vim.keymap.set({ "n", "t" }, "<C-.>", toggle_opencode_terminal, { desc = "Toggle OpenCode terminal" })

        -- Recommended/example keymaps
        vim.keymap.set({ "n", "x" }, "<C-a>", function()
            require("opencode").ask("@this: ")
        end, { desc = "Ask OpenCode" })

        vim.keymap.set({ "n", "x" }, "<C-x>", function()
            require("opencode").select()
        end, { desc = "Select OpenCode" })

        vim.keymap.set({ "n", "x" }, "go", function()
            return require("opencode").operator("@this")
        end, { desc = "Send range to OpenCode", expr = true })

        vim.keymap.set("n", "goo", function()
            return require("opencode").operator("@this") .. "_"
        end, { desc = "Send line to OpenCode", expr = true })
    end,
}
