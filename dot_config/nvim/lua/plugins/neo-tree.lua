return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			hijack_netrw_behavior = "open_default",
			window = {
				position = "current",
			},
		})

		vim.keymap.set("n", "<leader>pt", "<Cmd>Neotree toggle right<CR>")
		vim.keymap.set("n", "<leader>pe", "<Cmd>Neotree focus right<CR>")
		vim.keymap.set("n", "<leader>pv", "<Cmd>Neotree toggle current reveal<CR>")
	end
}
