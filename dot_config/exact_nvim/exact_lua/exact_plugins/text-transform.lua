local mode = { "n", "v" }

return {
	"chenasraf/text-transform.nvim",
	tag = "stable",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	opts = {},
	keys = {
		{ "<leader>Es", ":TtSnake<cr>",     mode, desc = "Transform text to snake_case",           silent = true },
		{ "<leader>ES", ":TtConst<cr>",     mode, desc = "Transform text to SCREAMING_SNAKE_CASE", silent = true },
		{ "<leader>Ec", ":TtCamel<cr>",     mode, desc = "Transform text to camelCase",            silent = true },
		{ "<leader>Ep", ":TtPascal<cr>",    mode, desc = "Transform text to PascalCase",           silent = true },
		{ "<leader>Ek", ":TtKebab<cr>",     mode, desc = "Transform text to kebab-case",           silent = true },
		{ "<leader>Ed", ":TtDot<cr>",       mode, desc = "Transform text to dot.case",             silent = true },
		{ "<leader>ET", ":TtTitle<cr>",     mode, desc = "Transform text to Title Case",           silent = true },
		{ "<leader>Et", ":TtTelescope<cr>", mode, desc = "Transform text",                         silent = true },
	},
}
