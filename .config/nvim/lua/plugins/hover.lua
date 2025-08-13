return {
	{
		"lewis6991/hover.nvim",
		config = function()
			require("hover").setup({
				init = function()
					-- Default providers (LSP is included by default)
					require("hover.providers.lsp")
					-- Add other providers if needed (e.g., `man`, `markdown`)
				end,
				preview_opts = {
					border = "rounded", -- Pretty border
					focusable = true,
				},
				-- Fix cursor jump by preventing focus theft
				mouse_delay = 0,
			})

			-- Keymaps (overrides Neovim's default 'K')
			vim.keymap.set("n", "K", function()
				local api = vim.api
				local hover_win = vim.b.hover_preview
				if hover_win and api.nvim_win_is_valid(hover_win) then
					api.nvim_set_current_win(hover_win)
				else
					require("hover").hover()
				end
			end, { desc = "hover.nvim" })
		end,
	},
}
