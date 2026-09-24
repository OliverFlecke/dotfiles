vim.pack.add({
	"https://github.com/kevinhwang91/promise-async",
	"https://github.com/kevinhwang91/nvim-ufo",
})

vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local lsps = vim.lsp.get_clients()
for _, ls in ipairs(lsps) do
	require("lspconfig")[ls].setup({
		capabilities = capabilities,
	})
end

require("ufo").setup({
	close_fold_kinds_for_ft = {
		default = { "imports", "comment" },
	},
})
