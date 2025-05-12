local mode = { "n", "v" }

return {
	"chenasraf/text-transform.nvim",
	tag          = "stable",
	dependencies = {
		'nvim-telescope/telescope.nvim',
		'nvim-lua/plenary.nvim',
	},
	opts         = {},
	keys         = {
		{ "<leader>Ts", ":TtSnake<cr>",     mode, desc = "Transform text to snake_case",           silent = true },
		{ "<leader>TS", ":TtConst<cr>",     mode, desc = "Transform text to SCREAMING_SNAKE_CASE", silent = true },
		{ "<leader>Tc", ":TtCamel<cr>",     mode, desc = "Transform text to camelCase",            silent = true },
		{ "<leader>Tp", ":TtPascal<cr>",    mode, desc = "Transform text to PascalCase",           silent = true },
		{ "<leader>Tk", ":TtKebab<cr>",     mode, desc = "Transform text to kebab-case",           silent = true },
		{ "<leader>Td", ":TtDot<cr>",       mode, desc = "Transform text to dot.case",             silent = true },
		{ "<leader>TT", ":TtTitle<cr>",     mode, desc = "Transform text to Title Case",           silent = true },
		{ "<leader>Tt", ":TtTelescope<cr>", mode, desc = "Transform text",                         silent = true },
	}
}
