return {
	{
		'williamboman/mason.nvim',
		opts = {
			ensure_installed = {
				"biome",
				"pyright",
				"stylua",
				"shellcheck",
				"shfmt",
				"omnisharp",
			},
		},
	},
	{ 'williamboman/mason-lspconfig.nvim' },
}
