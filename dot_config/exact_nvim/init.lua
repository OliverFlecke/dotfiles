-- require("config.lazy") -- Lazy config import
require("oliverflecke")

vim.cmd("packadd nvim.undotree")
vim.cmd("packadd nvim.difftool")
vim.keymap.set("n", "<leader>u", require("undotree").open)

vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim", -- Shared package used in many place
	"https://github.com/nvim-tree/nvim-web-devicons", -- Shared package used in many place
	"https://github.com/magicduck/grug-far.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
})

vim.api.nvim_create_autocmd("BufReadPost", {
	once = true,
	callback = function() require("gitsigns").setup({}) end,
})
