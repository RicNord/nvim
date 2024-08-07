local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Show diagnostics of line
keymap("n", "<leader>df", "<cmd>lua vim.diagnostic.open_float({ scope = 'l', source = 'always' })<CR>", opts)

-- Set filepath of buffer as cwd
keymap("n", "<leader>cdc", "<cmd>lua vim.fn.chdir(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))<CR>", opts)

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
