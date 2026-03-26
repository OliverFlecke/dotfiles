return {
	{
		"folke/zen-mode.nvim",
		opts = {
			plugins = {
				options = {
					ruler = false,
				},
			},
			on_open = function()
				vim.cmd("SoftWrapMode")
			end,
		},
		keys = {
			{ "<leader>zz", vim.cmd.ZenMode, desc = "Zen mode" },
		},
	},

	{
		"folke/twilight.nvim",
		opts = {
			context = 10,
		},
		keys = {
			{ "<leader>ppt", vim.cmd.Twilight, desc = "Toggle Twilight" },
		},
	},
}
