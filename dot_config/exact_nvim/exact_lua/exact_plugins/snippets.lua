return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		-- 'saadparwaiz1/cmp_luasnip',
	},

	config = function()
		local ls = require("luasnip")
		-- ls.log.set_loglevel("info")

		vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<C-E>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })

		require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })

		-- ls.log.open()
	end
}
