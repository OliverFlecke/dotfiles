return {
	'saghen/blink.cmp',
	-- optional: provides snippets for the snippet source
	dependencies = 'rafamadriz/friendly-snippets',
	version = "0.13.1",
	enabled = true,

	opts = {
		keymap = {
			preset = 'default',
			['<Tab>'] = { 'accept', 'fallback' },
		},
		appearance = {
			nerd_font_variant = 'mono'
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" }
}
