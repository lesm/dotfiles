return {
	{ "NMAC427/guess-indent.nvim", opts = {} }, -- Detect tabstop and shiftwidth automatically
	{
		"AndrewRadev/tagalong.vim",
		config = function()
			vim.g.tagalong_mappings = { "c", "C", "i", "a" }
		end,
	},
	"github/copilot.vim",
	"tpope/vim-obsession",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"tpope/vim-surround",
	"tpope/vim-repeat",
}
