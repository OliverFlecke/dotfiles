return {
	{
		'williamboman/mason.nvim',
		-- These are not loaded correctly, I think. Given that the LSP config
		-- calls the setup with different args, I'm not certain this works as expected.
		opts = {
			ensure_installed = {
				"biome",
				"pyright",
				"stylua",
				"shellcheck",
				"shfmt",
				'css-lsp',
				'css-variables-language-server',
				'harper-ls',
			},
		},
	},
	{ 'williamboman/mason-lspconfig.nvim' },
}
