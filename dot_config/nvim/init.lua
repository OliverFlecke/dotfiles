-- Configuration for neovim

require("paq")({
	"savq/paq-nvim",
	"kyazdani42/nvim-tree.lua",
	"vim-airline/vim-airline",
	"vim-airline/vim-airline-themes",
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-compe",
	"nvim-lua/plenary.nvim", -- Seems to be required for null-ls
	"jose-elias-alvarez/null-ls.nvim",
})

require("tree")
require("airline")
require("lsp")
require("completion")
require("lint")

require("settings")
