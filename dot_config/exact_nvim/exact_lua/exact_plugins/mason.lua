return {
	{
		'williamboman/mason.nvim',
		-- These are not loaded correctly, I think. Given that the LSP config
		-- calls the setup with different args, I'm not certain this works as expected.
		---@class MasonSettings
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
				'roslyn',
			},
			registries = {
				"github:Crashdummyy/mason-registry",
				"github:mason-org/mason-registry",
			}
		},
	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = { 'saghen/blink.cmp' },
		opts = {
			ensure_installed = {
				'ts_ls',
				-- 'eslint',
				'html',
				'cssls',
				'biome',
			}
		},

		config = function(_, opts)
			local lspconfig = require('lspconfig')
			local lsp_capabilities = require('blink.cmp').get_lsp_capabilities()

			require('mason-lspconfig').setup({
				opts.ensure_installed,
				handlers = {
					function(server)
						lspconfig[server].setup({
							capabilities = lsp_capabilities,
						})
					end,
				},
			})
		end
	},
}
