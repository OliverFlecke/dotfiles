return {
	"FotiadisM/tabset.nvim",
	opts = {
		defaults = {
			tabwidth = 4,
			expandtab = false,
		},
		languages = {
			yaml = {
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
	},
}
