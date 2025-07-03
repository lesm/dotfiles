-- Correct typical mistakes (capital letters)
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("WQa", "wqa", {})
vim.api.nvim_create_user_command("Wqa", "wqa", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("QA", "qa", {})
vim.api.nvim_create_user_command("Qa", "qa", {})
vim.api.nvim_create_user_command("Vsp", "vsp", {})
vim.api.nvim_create_user_command("Sp", "sp", {})

-- delete all spaces and tabs at the lines end
-- vim.keymap.set('n', '<F2>', [[:%s#\s\+$##<CR>]])
vim.keymap.set("n", "<F2>", [[:%s/\s\+$//<CR>]])

vim.keymap.set("n", "<F3>", function()
	local filepath = vim.fn.expand("%:.") -- Get relative file path
	vim.fn.setreg("+", filepath) -- Copy to system clipboard
	print("Copied to clipboard: " .. filepath)
end, { desc = "Copy file path to clipboard" })

-- disable arrow keys
vim.keymap.set("", "<Up>", "<NOP>")
vim.keymap.set("", "<Down>", "<NOP>")
vim.keymap.set("", "<Left>", "<NOP>")
vim.keymap.set("", "<Right>", "<NOP>")

-- git merge conflic
vim.keymap.set("n", "gdl", ":diffget LOCAL<CR>", { noremap = true })
vim.keymap.set("n", "gdr", ":diffget REMOTE<CR>", { noremap = true })
vim.keymap.set("n", "gdb", ":diffget BASE<CR>", { noremap = true })

-- Netrw to open preview buffet in the right side (vertical)
vim.g.netrw_preview = 1 -- Enable preview mode with `p`

-- set relativenumber in netrw
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.wo.relativenumber = true
	end,
})

-- Use VimEnter to ensure the highlight is applied after everything loads
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd([[highlight ColorColumn ctermbg=red guibg=#7d3c98]])
	end,
})

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- 1. Force all .erb files (including Rails variants) to be 'eruby' filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.erb", -- Matches ALL .erb files (including .html+drawer.erb)
	command = "set filetype=eruby",
})

-- 2. Custom indentation for eruby (including <p><span> fix)
vim.api.nvim_create_autocmd("FileType", {
	pattern = "eruby",
	callback = function()
		-- Fix for <p><span> indentation
		vim.cmd([[
      let g:html_indent_inctags = "html,body,head,p,span,div,section,article"
      setlocal indentexpr=HtmlIndentWithSpanSupport()
      function! HtmlIndentWithSpanSupport()
        let l:ret = HtmlIndent()
        if getline(v:lnum) =~ '<span' && getline(v:lnum-1) =~ '<p\|<div\|<section\|<article'
          return indent(v:lnum-1) + shiftwidth()
        endif
        return l:ret
      endfunction
    ]])
	end,
})
