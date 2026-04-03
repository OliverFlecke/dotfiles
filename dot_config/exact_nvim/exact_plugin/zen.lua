vim.pack.add({
	"https://github.com/folke/zen-mode.nvim",
	"https://github.com/folke/twilight.nvim",
})

require("zen-mode").setup({
	plugins = {
		options = {
			ruler = false,
		},
	},
	on_open = function() vim.cmd("SoftWrapMode") end,
})
require("twilight").setup({
	context = 10,
})

-- vim.keymap.set("n", "<leader>ppt", vim.cmd.Twilight, { desc = "Toggle Twilight" })
vim.keymap.set("n", "<leader>zz", vim.cmd.ZenMode, { desc = "Zen mode" })
