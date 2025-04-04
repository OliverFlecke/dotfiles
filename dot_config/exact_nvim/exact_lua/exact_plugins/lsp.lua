return {
	'neovim/nvim-lspconfig',
	dependencies = { 'saghen/blink.cmp' },
	opts = {},

	config = function()
		-- This is where you enable features that only work
		-- if there is a language server active in the file
		vim.api.nvim_create_autocmd('LspAttach', {
			desc = 'LSP actions',
			callback = function(event)
				local options = { buffer = event.buf }

				vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, options)
				vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', options)
				vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', options)
				vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', options)
				vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', options)
				vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', options)
				vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', options)
				-- vim.keymap.set('n', '<C-R>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
				vim.keymap.set({ 'n', 'x' }, '<leader>vcf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', options)

				vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, options)
				vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, options)
				vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, options)
				vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, options)
				vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, options)
				vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, options)
			end,
		})

		local lspconfig = require('lspconfig')
		local lsp_capabilities = require('blink.cmp').get_lsp_capabilities()
		require('mason').setup({})
		require('mason-lspconfig').setup({
			ensure_installed = {
				'ts_ls',
				-- 'eslint',
				'html',
				'cssls',
				'biome',
			},
			handlers = {
				function(server)
					lspconfig[server].setup({
						capabilities = lsp_capabilities,
					})
				end,
			},
		})

		lspconfig.harper_ls.setup {
			settings = {
				["harper_ls"] = {
					filetypes = { "gitcommit", "markdown" }
				}
			}
		}
	end
}
