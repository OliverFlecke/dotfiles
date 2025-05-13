return {
	"danymat/neogen",
	version = "*",
	opts = {
		snippet_engine = "luasnip",
		languages = {
			cs = {
				template = {
					annotation_convention = "xmldoc",
				},
			},
		},
	},
	keys = {
		{ "<leader>nf", "<cmd>Neogen<CR>", desc = "Generate docs template" },
	}
}
