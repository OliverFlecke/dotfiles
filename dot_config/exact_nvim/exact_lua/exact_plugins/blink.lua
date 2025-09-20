return {
	'saghen/blink.cmp',
	-- Optional: provides snippets for the snippet source
	dependencies = {
		'rafamadriz/friendly-snippets',
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	-- commit = "b56a1701f3043ee6d52471bb2c5362c1aaacb1c9", -- Version without NULL error on completion
	version = "1.*",
	enabled = true,

	opts = {
		keymap = {
			preset = 'default',
			-- ['<Tab>'] = { 'accept', 'fallback' },
			['<C-f>'] = { 'select_and_accept' },
			['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end },
			['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end },
			['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end },
			['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end },
			['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end },
			['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end },
			['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end },
			['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end },
			['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end },
			['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end },
		},
		appearance = {
			nerd_font_variant = 'mono'
		},
		signature = {
			enabled = true,
			window = { border = 'single' },
		},
		completion = {
			menu = {
				border = 'single',
				-- Draw the index of each completion item
				draw = {
					columns = {
						{ 'item_idx' },
						{ 'kind_icon' },
						{ 'label',      'label_description', gap = 1 },
						{ 'source_name' },
						-- { 'kind' }
					},
					components = {
						item_idx = {
							text = function(ctx)
								return ctx.idx == 10 and '0' or ctx.idx >= 10 and ' ' or tostring(ctx.idx)
							end,
							highlight = 'BlinkCmpItemIdx' -- optional, only if you want to change its color
						}
					}
				}
			},
			documentation = { window = { border = 'single' } },
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
			},
		},
		fuzzy = {
			sorts = {
				-- 'exact',
				-- defaults
				'score',
				'sort_text',
			},
			-- implementation = "prefer_rust_with_warning",
			implementation = "lua",
		},
	},
	opts_extend = { "sources.default" }

}
