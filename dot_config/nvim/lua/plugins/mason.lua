return {
	{
		'williamboman/mason.nvim',
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
			},
		},
	},
	{ 'williamboman/mason-lspconfig.nvim' },
}
