return {
	"ellisonleao/gruvbox.nvim",
	name = "gruvbox",
	lazy = false,
	priority = 1000,
	opts = {
		contrast = "hard", -- darker background (#1d2021)
	},
	config = function(_, opts)
		require("gruvbox").setup(opts)
		vim.cmd.colorscheme("gruvbox")
	end,
}
