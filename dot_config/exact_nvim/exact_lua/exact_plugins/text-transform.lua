return {
	"chenasraf/text-transform.nvim",
	tag          = "stable",
	dependencies = {
		'nvim-telescope/telescope.nvim',
		'nvim-lua/plenary.nvim',
	},
	opts         = {},
	keys         = {
		{ "<leader>ts", ":TtSnake<cr>",     mode = { "n", "v", }, desc = "Transform text to snake_case",           silent = true },
		{ "<leader>tS", ":TtConst<cr>",     mode = { "n", "v", }, desc = "Transform text to SCREAMING_SNAKE_CASE", silent = true },
		{ "<leader>tc", ":TtCamel<cr>",     mode = { "n", "v", }, desc = "Transform text to camelCase",            silent = true },
		{ "<leader>tp", ":TtPascal<cr>",    mode = { "n", "v", }, desc = "Transform text to PascalCase",           silent = true },
		{ "<leader>tk", ":TtKebab<cr>",     mode = { "n", "v", }, desc = "Transform text to kebab-case",           silent = true },
		{ "<leader>td", ":TtDot<cr>",       mode = { "n", "v", }, desc = "Transform text to dot.case",             silent = true },
		{ "<leader>tT", ":TtTitle<cr>",     mode = { "n", "v", }, desc = "Transform text to Title Case",           silent = true },
		{ "<leader>tt", ":TtTelescope<cr>", mode = { "n", "v", }, desc = "Transform text",                         silent = true },
	}
}
