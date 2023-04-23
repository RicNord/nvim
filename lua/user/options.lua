local options = {
	swapfile = false,
	backup = false, -- creates a backup file
	undodir = os.getenv("HOME") .. "/.vim/undodir",
	undofile = true,

	cmdheight = 2, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	showmode = true,
    showtabline = 2, -- always show tabs

	smartcase = true, -- smart case
    autoindent = true, -- apply current row indentation on new created adjacent row
	smartindent = true, -- make indenting smarter with help of syntax/style

	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	termguicolors = true,                    -- set term gui colors (most terminals support this)
	updatetime = 300, -- faster completion (4000ms default)

	expandtab = true, -- convert tabs to spaces
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	tabstop = 4, -- show 4 spaces for a tab (some git providers use 8 by default)
	softtabstop = 4, -- insermode tab option
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines

	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	linebreak = true, -- companion to wrap, don't split words
	scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor
	sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
	colorcolumn = "80",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use
