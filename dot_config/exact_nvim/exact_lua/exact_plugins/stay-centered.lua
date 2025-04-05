return {
	'arnamak/stay-centered.nvim',
	opts = {},
	keys = {
		{
			'<leader>st',
			function() require('stay-centered').toggle() end,
			desc = 'Toggle stay-centered.nvim',
			mode = { 'n', 'v' },
		},
	},
}
