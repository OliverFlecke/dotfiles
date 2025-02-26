return {
	'neovim/nvim-lspconfig',
	opt = {
		servers = {
			biome = {},
		},
	},

	config = function()
		vim.opt.signcolumn = 'yes'

		local lspconfig = require('lspconfig')
		local lspconfig_defaults = lspconfig.util.default_config
		lspconfig_defaults.capabilities = vim.tbl_deep_extend(
			'force',
			lspconfig_defaults.capabilities,
			require('cmp_nvim_lsp').default_capabilities()
		)

		local cmp = require('cmp')
		cmp.setup({
			sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				},
				{
					{ name = "buffer" },
				}),
			mapping = cmp.mapping.preset.insert({
				-- Navigate between completion items
				['<C-p>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
				['<C-n>'] = cmp.mapping.select_next_item({ behavior = 'select' }),

				-- `Enter` key to confirm completion
				['<Tab>'] = cmp.mapping.confirm({ select = true }),

				-- Ctrl+Space to trigger completion menu
				['<C-Space>'] = cmp.mapping.complete(),

				-- Scroll up and down in the completion documentation
				['<C-u>'] = cmp.mapping.scroll_docs(-4),
				['<C-d>'] = cmp.mapping.scroll_docs(4),
			}),
			snippet = {
				expand = function(args)
					-- vim.snippet.expand(args.body)
					require('luasnip').lsp_expand(args.body)
				end,
			},
		})

		-- This is where you enable features that only work
		-- if there is a language server active in the file
		vim.api.nvim_create_autocmd('LspAttach', {
			desc = 'LSP actions',
			callback = function(event)
				local opts = { buffer = event.buf }

				vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
				vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
				vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
				vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
				vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
				vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
				vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
				-- vim.keymap.set('n', '<C-R>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
				vim.keymap.set({ 'n', 'x' }, '<leader>vcf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)

				vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
				vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
				vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
				vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
				vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
				vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
			end,
		})

		local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

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

		-- vim.api.nvim_create_autocmd("LspAttach", {
		-- 	group = vim.api.nvim_create_augroup("lsp", { clear = true }),
		-- 	callback = function(args)
		-- 		vim.api.nvim_create_autocmd("BufWritePre", {
		-- 			buffer = args.buf,
		-- 			callback = function()
		-- 				vim.lsp.buf.format { async = false, id = args.data.client_id }
		-- 			end,
		-- 		})
		-- 	end
		-- })

		for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
			local default_diagnostic_handler = vim.lsp.handlers[method]
			vim.lsp.handlers[method] = function(err, result, context, config)
				if err ~= nil and err.code == -32802 then
					return
				end
				return default_diagnostic_handler(err, result, context, config)
			end
		end

		-- Define comment string for SQL file types
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "sql",
			callback = function()
				vim.bo.commentstring = "-- %s"
			end
		})
	end
}
