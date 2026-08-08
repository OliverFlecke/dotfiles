vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
	picker = {
		sources = {
			files = {
				hidden = true,
				exclude = { "*.lock" },
			},
			grep = {
				args = {
					"--glob",
					"!pnpm-lock.yaml",
					"--glob",
					"!package-lock.json",
					"--glob",
					"!yarn.lock",
				},
			},
		},
	},
})

vim.keymap.set("n", "<leader>,", function() Snacks.Picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", function() Snacks.Picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>f", function() Snacks.Picker.files() end, { desc = "Files" })
