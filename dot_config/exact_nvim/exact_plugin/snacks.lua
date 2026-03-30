vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
	picker = {},
})

vim.keymap.set("n", "<leader>,", function() Snacks.Picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", function() Snacks.Picker.grep() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>f", function() Snacks.Picker.files() end, { desc = "Buffers" })
