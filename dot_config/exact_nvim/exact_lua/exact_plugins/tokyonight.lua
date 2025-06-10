return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
		style = "night",
		on_highlights = function(hl, _)
			hl.ColorColumn = {
				bg = "#16161e"
			}
		end,
	},

	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd("colorscheme tokyonight")
	end
}
