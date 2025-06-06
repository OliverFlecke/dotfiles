return {
	"stevearc/conform.nvim",
	-- optional = true,
	opts = {
		formatters_by_ft = {
			javascript = { "biome", stop_after_first = true },
			typescript = { "biome", stop_after_first = true },
			typescriptreact = { "biome", stop_after_first = true },
			css = { "biome", stop_after_first = true },
			typst = { "typstyle", stop_after_first = true },
			-- lua = { "stylua" },
			toml = { "taplo", stop_after_first = true },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
