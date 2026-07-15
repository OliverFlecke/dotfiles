vim.pack.add({
	"https://github.com/folke/trouble.nvim",
	"https://github.com/artemave/workspace-diagnostics.nvim",
	"https://github.com/rachartier/tiny-inline-diagnostic.nvim",
})
require("trouble").setup()
-- require("tiny-inline-diagnostic").setup()

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>xX",
	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	{ desc = "Buffer Diagnostics (Trouble)" }
)
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>cl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

vim.api.nvim_set_keymap("n", "<space>xa", "", {
	noremap = true,
	callback = function()
		for _, client in ipairs(vim.lsp.buf_get_clients()) do
			require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
		end
	end,
})
