return {
	'neovim/nvim-lspconfig',
	dependencies = { 'saghen/blink.cmp' },
	opts = {},
	keys = {
		{ '<leader>vci', '<cmd>!pnpm biome lint --write --only=correctness/noUnusedImports<cr>', desc = "TS remove unused imports" },
	},
	config = function()
		-- This is where you enable features that only work
		-- if there is a language server active in the file
		vim.api.nvim_create_autocmd('LspAttach', {
			desc = 'LSP actions',
			callback = function(event)
				local opts = { buffer = event.buf }

				vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
				vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
				vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
				vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
				vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
				vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
				vim.keymap.set({ 'n', 'x' }, '<leader>vcf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)

				vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
				vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
				vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
			end,
		})
	end
}
