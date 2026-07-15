vim.pack.add({
	"https://github.com/folke/zen-mode.nvim",
	"https://github.com/folke/twilight.nvim",
})

require("twilight").setup({
	context = 10,
})
require("zen-mode").setup({
	window = {
		backdrop = 1,
		width = 100,
	},
	plugins = {
		options = {
			ruler = false,
		},
		twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
		gitsigns = { enabled = true },
		tmux = { enabled = true },
	},
	on_open = function()
		vim.b.completion = false
		vim.cmd("SoftWrapMode")
		vim.cmd("SupermavenStop")
	end,
})

-- vim.keymap.set("n", "<leader>ppt", vim.cmd.Twilight, { desc = "Toggle Twilight" })
vim.keymap.set("n", "<leader>zz", vim.cmd.ZenMode, { desc = "Zen mode" })
