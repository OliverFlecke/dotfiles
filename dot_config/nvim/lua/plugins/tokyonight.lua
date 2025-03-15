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

			-- Make telescope borderless
			on_highlights = function(hl, c)
				hl.ColorColumn = {
					bg = c.blue7
				}

				-- local prompt = "#2d3149"
				-- hl.TelescopeNormal = {
				-- 	bg = c.bg_dark,
				-- 	fg = c.fg_dark,
				-- }
				-- hl.TelescopeBorder = {
				-- 	bg = c.bg_dark,
				-- 	fg = c.bg_dark,
				-- }
				-- hl.TelescopePromptNormal = {
				-- 	bg = prompt,
				-- }
				-- hl.TelescopePromptBorder = {
				-- 	bg = prompt,
				-- 	fg = prompt,
				-- }
				-- hl.TelescopePromptTitle = {
				-- 	bg = prompt,
				-- 	fg = prompt,
				-- }
				-- hl.TelescopePreviewTitle = {
				-- 	bg = c.bg_dark,
				-- 	fg = c.bg_dark,
				-- }
				-- hl.TelescopeResultsTitle = {
				-- 	bg = c.bg_dark,
				-- 	fg = c.bg_dark,
				-- }
			end,
		})

		vim.cmd("colorscheme tokyonight")
	end
}
