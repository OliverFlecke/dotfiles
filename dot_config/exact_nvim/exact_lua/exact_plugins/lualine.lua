return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			theme = "ayu_mirage",
			section_separators = { left = '', right = '' },
			component_separators = { left = '', right = '' },
		},
		extensions = {
			"oil"
		}
	},
}
