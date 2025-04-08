return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
		style = "night",
		on_highlights = function(hl, colors)
			hl.ColorColumn = {
				bg = colors.dark5
			}
		end,
	},

	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd("colorscheme tokyonight")
	end
}
