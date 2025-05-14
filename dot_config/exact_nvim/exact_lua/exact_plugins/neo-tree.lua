return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		-- hijack_netrw_behavior = "open_default",
		window = {
			position = "current",
		},
	},
	keys = {
		{ "<leader>pt", "<cmd>Neotree toggle right<CR>",          desc = "Neotree toggle" },
		{ "<leader>pe", "<cmd>Neotree focus right<CR>",           desc = "Neotree focus" },
		{ "<leader>pV", "<cmd>Neotree toggle current reveal<CR>", desc = "Neotree full screen" },
	},
}
