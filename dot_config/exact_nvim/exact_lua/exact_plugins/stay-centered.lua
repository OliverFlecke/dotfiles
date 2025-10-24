return {
	"arnamak/stay-centered.nvim",
	enabled = false,
	lazy = false,
	opts = {},
	keys = {
		{
			"<leader>st",
			function()
				require("stay-centered").toggle()
			end,
			desc = "Toggle stay-centered",
			mode = { "n", "v" },
		},
	},
}
