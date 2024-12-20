vim.opt.swapfile = false
vim.opt.backup = false -- creates a backup file
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.showmode = true
vim.opt.showtabline = 2                         -- always show tabs

vim.opt.smartcase = true                        -- smart case
vim.opt.autoindent = true                       -- apply current row indentation on new created adjacent row
vim.opt.smartindent = true                      -- make indenting smarter with help of syntax/style

vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.updatetime = 300                        -- faster completion (4000ms default)

vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- show 4 spaces for a tab (some git providers use 8 by default)
vim.opt.softtabstop = 4                         -- insermode tab option
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbered lines

vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.linebreak = true                        -- companion to wrap, don't split words
vim.opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8                       -- minimal number of screen columns either side of cursor if wrap is `false`
vim.opt.colorcolumn = "80"

vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use
