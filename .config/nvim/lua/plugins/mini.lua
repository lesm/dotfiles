return {
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			local statusline = require("mini.statusline")

			-- Update section_location to include Obsession status
			statusline.section_location = function()
				return "%2l:%-2v" .. " %{ObsessionStatus()}"
			end

			-- Define custom highlight groups
			vim.cmd([[
        highlight FileModified guifg=#ffffff guibg=#7d3c98   gui=bold
        highlight FileNormal guifg=#ffffff guibg=#44475a gui=bold
        ]])

			-- Custom filename section
			statusline.section_filename = function()
				local filename = vim.fn.expand("%:t") -- Get the filename
				if filename == "" then
					filename = "[No Name]"
				end

				if vim.bo.modified then
					return "%#FileModified#" .. filename .. " [+]" .. "%#FileNormal#"
				else
					return filename
				end
			end

			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = vim.g.have_nerd_font })
		end,
	},
}
