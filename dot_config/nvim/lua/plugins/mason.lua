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
				'css-lsp',
				'css-variables-language-server',
			},
		},
	},
	{ 'williamboman/mason-lspconfig.nvim' },
}
