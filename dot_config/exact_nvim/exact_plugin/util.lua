vim.pack.add({
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/fotiadism/tabset.nvim",
	"https://github.com/andrewferrier/wrapping.nvim",
	"https://github.com/arnamak/stay-centered.nvim",
})

vim.keymap.set(
	{ "n", "v" },
	"<leader>st",
	function() require("stay-centered").toggle() end,
	{ desc = "Toggel stay-centered" }
)

vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	callback = function()
		require("nvim-autopairs").setup()
		require("nvim-ts-autotag").setup()
	end,
})

require("wrapping").setup()
require("tabset").setup({
	defaults = {
		tabwidth = 4,
		expandtab = false,
	},
	languages = {
		yaml = {
			filetypes = {
				"yaml",
				"yml",
			},
			expandtab = true,
			tabwidth = 2,
		},
		lua = {
			tabwidth = 2,
		},
		python = {
			expandtab = true,
		},
		{
			filetypes = {
				"html",
				"mjml", -- Template language for emails
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
			},
			config = {
				tabwidth = 2,
			},
		},
	},
})
