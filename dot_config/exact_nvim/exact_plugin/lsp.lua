vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },
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
			sql = {
				"snippets",
				--	"dadbod",
				"buffer",
			},
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
vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy",
			},
		},
	},
})

-- Installed via `brew install JetBrains/utils/kotlin-lsp`, not Mason: the
-- Mason registry's download pin is to a build no longer on JetBrains' CDN.
-- Homebrew exposes the binary as `kotlin-lsp`, not the `intellij-server`
-- name nvim-lspconfig's default assumes.
vim.lsp.config("kotlin_lsp", {
	cmd = { "kotlin-lsp", "--stdio" },
})
vim.lsp.enable("kotlin_lsp")

mason.setup({
	registries = {
		"github:Crashdummyy/mason-registry",
		"github:mason-org/mason-registry",
	},
})
mason_lspconfig.setup()

local packages = {
	-- language servers
	"biome",
	"css-lsp",
	"css-variables-language-server",
	"harper-ls",
	"roslyn",
	"emmet-language-server",
	"gh-actions-language-server",
	"harper-ls",
	"json-lsp",
	"html-lsp",
	"lua-language-server",
	"pkl-lsp",
	"ruff",
	"rust-analyzer",
	"taplo",
	"ty",
	"typescript-language-server",
	"tsc",
	"yaml-language-server",

	-- formatters and linters
	"kdlfmt",
	"ktfmt",
	"shellcheck",
	"shfmt",
	"stylua",
	"typstyle", -- Typst LSP and formatter
	"yamllint",
}

local registry = require("mason-registry")
registry.refresh(vim.schedule_wrap(function()
	for _, name in ipairs(packages) do
		local pkg = registry.get_package(name)
		if not pkg:is_installed() and not pkg:is_installing() then
			pkg:install()
		end
	end
end))
