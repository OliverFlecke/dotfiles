vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	{ src = "https://github.com/saghen/blink.cmp", verson = vim.version.range("1.x") },
	"https://github.com/rafamadriz/friendly-snippets",
})

vim.keymap.set("n", "<D-.>", vim.lsp.buf.code_action, { desc = "Code action" })

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<leader>vcf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)

		vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)
		vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
	end,
})

local lspconfig = require("lspconfig")
local blink = require("blink.cmp")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

blink.setup({
	keymap = {
		preset = "default",
		["<C-f>"] = { "select_and_accept" },
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	signature = {
		enabled = true,
		window = { border = "single" },
	},
	completion = {
		menu = {
			border = "single",
			draw = {
				columns = {
					{ "item_idx" },
					{ "kind_icon" },
					{ "label", "label_description", gap = 1 },
					{ "source_name" },
					-- { 'kind' }
				},
				components = {
					item_idx = {
						text = function(ctx) return ctx.idx == 10 and "0" or ctx.idx >= 10 and " " or tostring(ctx.idx) end,
						highlight = "BlinkCmpItemIdx", -- optional, only if you want to change its color
					},
				},
			},
		},
		documentation = { window = { border = "single" } },
	},
	sources = {
		-- default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		per_filetype = {
			sql = { "snippets", "dadbod", "buffer" },
		},
		providers = {
			-- lazydev = {
			-- 	name = "LazyDev",
			-- 	module = "lazydev.integrations.blink",
			-- 	score_offset = 100,
			-- },
			-- dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
		},
	},
	fuzzy = {
		sorts = { "exact", "score", "sort_text" },
		implementation = "lua",
	},
})
-- for server, config in pairs(opts.servers) do
-- 	config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
-- 	lspconfig[server].setup(config)
-- end

mason.setup({
	ensure_installed = {
		"biome",
		"basedpyright",
		"stylua",
		"shellcheck",
		"shfmt",
		"css-lsp",
		"css-variables-language-server",
		"harper-ls",
		"roslyn",
		"tsgo",
		"typstyle", -- Typst LSP and formatter
		"tinymist",
	},
	registries = {
		"github:Crashdummyy/mason-registry",
		"github:mason-org/mason-registry",
	},
})

mason_lspconfig.setup({
	automatic_enable = true,
	ensure_installed = {
		"html",
		"cssls",
		"biome",
	},
	handlers = {
		function(server)
			lspconfig[server].setup({
				capabilities = blink.get_lsp_capabilties(),
			})
		end,
	},
})
