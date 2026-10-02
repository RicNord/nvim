local M = {}

local state = {
    buf = nil,
    win = nil,
}

local keybindings_file = vim.fs.joinpath(vim.fn.stdpath("config"), "added-keybindings.md")
local footer_lines = {
    "",
    "---",
    "Press `q` or `<Esc>` to close.",
}

local function is_window_valid(win)
    return win ~= nil and vim.api.nvim_win_is_valid(win)
end

local function is_buffer_valid(buf)
    return buf ~= nil and vim.api.nvim_buf_is_valid(buf)
end

local function close()
    if is_window_valid(state.win) then
        vim.api.nvim_win_close(state.win, true)
    end

    state.win = nil
    state.buf = nil
end

local function build_fallback_lines(message)
    return {
        "# Keybindings",
        "",
        message,
        table.unpack(footer_lines),
    }
end

local function read_markdown_lines()
    if vim.fn.filereadable(keybindings_file) == 0 then
        return build_fallback_lines(
            string.format("> Unable to open `%s`", vim.fn.fnamemodify(keybindings_file, ":~:."))
        )
    end

    local lines = vim.fn.readfile(keybindings_file)
    if vim.tbl_isempty(lines) then
        return build_fallback_lines("> The keybindings file is empty.")
    end

    return vim.list_extend(lines, vim.deepcopy(footer_lines))
end

local function ensure_buffer()
    if is_buffer_valid(state.buf) then
        return state.buf
    end

    state.buf = vim.api.nvim_create_buf(false, true)

    vim.bo[state.buf].bufhidden = "wipe"
    vim.bo[state.buf].buftype = "nofile"
    vim.bo[state.buf].buflisted = false
    vim.bo[state.buf].filetype = "markdown"
    vim.bo[state.buf].modifiable = false
    vim.bo[state.buf].swapfile = false

    vim.keymap.set("n", "q", close, { buffer = state.buf, silent = true, nowait = true })
    vim.keymap.set("n", "<Esc>", close, { buffer = state.buf, silent = true, nowait = true })

    return state.buf
end

local function update_buffer(buf, lines)
    vim.bo[buf].modifiable = true
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].modifiable = false
end

local function calculate_window_size(lines)
    local width = math.min(100, math.max(60, math.floor(vim.o.columns * 0.75)))
    local height = math.min(#lines + 2, math.max(12, math.floor(vim.o.lines * 0.7)))

    return {
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
    }
end

function M.open()
    if is_window_valid(state.win) then
        local win = assert(state.win)
        vim.api.nvim_set_current_win(win)
        return
    end

    local lines = read_markdown_lines()
    local buf = assert(ensure_buffer())
    local size = calculate_window_size(lines)

    update_buffer(buf, lines)

    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        row = size.row,
        col = size.col,
        width = size.width,
        height = size.height,
        style = "minimal",
        border = "rounded",
        title = " Keybindings ",
        title_pos = "center",
    })

    state.win = win

    vim.wo[win].conceallevel = 3
    vim.wo[win].cursorline = false
    vim.wo[win].linebreak = true
    vim.wo[win].number = false
    vim.wo[win].relativenumber = false
    vim.wo[win].signcolumn = "no"
    vim.wo[win].spell = false
    vim.wo[win].wrap = true
end

function M.setup()
    vim.api.nvim_create_user_command("KeybindingsHelp", function()
        M.open()
    end, { desc = "Open keybindings help window" })
end

return M
