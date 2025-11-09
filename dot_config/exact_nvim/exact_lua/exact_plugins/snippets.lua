return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	keys = {
		{
			"<C-k>",
			function()
				require("luasnip").expand({})
			end,
			{ silent = true },
			mode = { "i" },
			desc = "Snippet expand",
		},
		{
			"<C-S-l>",
			function()
				require("luasnip").jump(1)
			end,
			{ silent = true },
			mode = { "i", "s" },
			desc = "Snippet next",
		},
		{
			"<C-S-h>",
			function()
				require("luasnip").jump(-1)
			end,
			{ silent = true },
			mode = { "i", "s" },
			desc = "Snippet prev",
		},
		{
			"<C-e>",
			function()
				local ls = require("luasnip")
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end,
			{ silent = true },
			mode = { "i", "s" },
		},
	},

	config = function()
		require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
	end,
}
