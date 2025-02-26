return
{
	'stevearc/conform.nvim',
	-- optional = true,
	config = function()
		require('conform').setup({
			formatters_by_ft = {
				javascript = { "biome", stop_after_first = true },
				typescript = { "biome", stop_after_first = true },
				css = { "biome", stop_after_first = true },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,

	-- opts = function(_, opts)
	-- 	opts.formatters_by_ft = opts.formatters_by_ft or {}
	-- 	for _, ft in ipairs(supported) do
	-- 		opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
	-- 		table.insert(opts.formatters_by_ft[ft], "biome")
	-- 	end
	--
	-- 	opts.formatters = opts.formatters or {}
	-- 	opts.formatters.biome = {
	-- 		require_cwd = true,
	-- 	}
	-- end,
}
