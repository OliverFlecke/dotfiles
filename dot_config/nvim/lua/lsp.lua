-- Configuration for lsp

local lspconfig = require('lspconfig')
local servers = {
	"pyright",
}

lspconfig.pyright.setup({})
