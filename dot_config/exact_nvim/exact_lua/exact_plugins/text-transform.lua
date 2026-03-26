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
		{ "<leader>Rs", ":TtSnake<cr>",     mode, desc = "Transform text to snake_case",           silent = true },
		{ "<leader>RS", ":TtConst<cr>",     mode, desc = "Transform text to SCREAMING_SNAKE_CASE", silent = true },
		{ "<leader>Rc", ":TtCamel<cr>",     mode, desc = "Transform text to camelCase",            silent = true },
		{ "<leader>Rp", ":TtPascal<cr>",    mode, desc = "Transform text to PascalCase",           silent = true },
		{ "<leader>Rk", ":TtKebab<cr>",     mode, desc = "Transform text to kebab-case",           silent = true },
		{ "<leader>Rd", ":TtDot<cr>",       mode, desc = "Transform text to dot.case",             silent = true },
		{ "<leader>RT", ":TtTitle<cr>",     mode, desc = "Transform text to Title Case",           silent = true },
		{ "<leader>Rt", ":TtTelescope<cr>", mode, desc = "Transform text",                         silent = true },
	},
}
