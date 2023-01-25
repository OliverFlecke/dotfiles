-- Configuration for lsp

-- local lspconfig = require('lspconfig')
local servers = {
	"pyright",
}

require("lspconfig").pyright.setup({})
