vim.cmd("filetype plugin indent on")

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

vim.opt.relativenumber = true
vim.opt.mouse = ""
vim.opt.path:append("**")
vim.opt.wildmenu = true
vim.opt.wildignore:append({ "*/node_modules/*", "*/.git/*" }) -- Ignore unnecessary dirs

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
-- vim.o.splitright = true
-- vim.o.splitbelow = true

-- Set global indentation to 2 spaces
vim.opt.shiftwidth = 2 -- Indent size for <<, >>, ==, etc.
vim.opt.tabstop = 2 -- Visual width of a tab character
vim.opt.expandtab = true -- Convert tabs to spaces (recommended)

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.colorcolumn = "100"

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 5

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
