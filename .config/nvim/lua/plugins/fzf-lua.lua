return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({
			winopts = {
				height = 0.95,
				width = 0.90,
				row = 0.35,
				col = 0.50,
			},
		})
		-- vim.api.nvim_set_keymap('n', '<C-\\>', [[<Cmd>lua require"fzf-lua".buffers()<CR>]], {})
		-- vim.api.nvim_set_keymap('n', '<C-k>', [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
		-- vim.api.nvim_set_keymap('n', '<C-p>', [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
		-- vim.api.nvim_set_keymap('n', '<C-l>', [[<Cmd>lua require"fzf-lua".live_grep_glob()<CR>]], {})
		-- vim.api.nvim_set_keymap('n', '<C-g>', [[<Cmd>lua require"fzf-lua".grep_project()<CR>]], {})
		-- vim.api.nvim_set_keymap('n', '<F1>', [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], {})

		vim.keymap.set("n", "<leader>sh", [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], { desc = "[S]earch [H]elp" })
		-- vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
		vim.keymap.set("n", "<leader>sf", [[<Cmd>lua require"fzf-lua".files()<CR>]], { desc = "[S]earch [F]iles" })
		-- im.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
		-- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
		-- vim.keymap.set('n', '<leader>sl', [[<Cmd>lua require"fzf-lua".live_grep_glob()<CR>]], { desc = '[S]earch by [G]rep' })
		vim.keymap.set(
			"n",
			"<leader>sg",
			[[<Cmd>lua require"fzf-lua".grep_project()<CR>]],
			{ desc = "[S]earch by [G]rep All Project lines" }
		)
		-- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
		vim.keymap.set("n", "<leader>sr", [[<Cmd>lua require"fzf-lua".resume()<CR>]], { desc = "[S]earch [R]esume" })
		-- vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		-- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
		--
	end,
}
