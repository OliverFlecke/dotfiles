return {
	"folke/tokyonight.nvim",
	enable = true,
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
		style = "night",
	},
	config = function()
		require("tokyonight").setup({
			style = "night",
			transparent = true,
		})

		vim.cmd("colorscheme tokyonight")
	end
}
