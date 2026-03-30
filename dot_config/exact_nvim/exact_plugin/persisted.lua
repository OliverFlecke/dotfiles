vim.pack.add({ "https://github.com/olimorris/persisted.nvim" })

require("persisted").setup({
	autoload = false,
})
vim.keymap.set("n", "<leader>L", "<CMD>Persisted load<cr>", { desc = "Load session" })
