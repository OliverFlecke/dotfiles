vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
})

require("tokyonight").setup({
	transparent = true,
	style = "night",
	on_highlights = function(hl, _)
		hl.ColorColumn = {
			bg = "#16161e",
		}
	end,
})
vim.cmd.colorscheme("tokyonight")

require("lualine").setup({
	options = {
		theme = "tokyonight",
	},
	extensions = {
		"oil",
	},
	sections = {
		lualine_c = { { "filename", path = 1, shorting_target = 60 } },
	},
})
