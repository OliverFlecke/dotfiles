return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"biome",
				"pyright",
				"stylua",
				"shellcheck",
				"shfmt",
				"css-lsp",
				"css-variables-language-server",
				"harper-ls",
				"roslyn",
				-- Typst LSP and formatter
				"typstyle",
				"tinymist",
			},
			registries = {
				"github:Crashdummyy/mason-registry",
				"github:mason-org/mason-registry",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "saghen/blink.cmp" },
		opts = {
			ensure_installed = {
				"ts_ls",
				-- 'eslint',
				"html",
				"cssls",
				"biome",
			},
		},

		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local lsp_capabilities = require("blink.cmp").get_lsp_capabilities()

			require("mason-lspconfig").setup({
				ensure_installed = opts.ensure_installed,
				handlers = {
					function(server)
						lspconfig[server].setup({
							capabilities = lsp_capabilities,
						})
					end,
				},
			})
		end,
	},
}
