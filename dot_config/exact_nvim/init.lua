-- require("config.lazy") -- Lazy config import
require("oliverflecke")

-- vim.lsp.codelens.enable(true)

vim.cmd("packadd nvim.undotree")
vim.cmd("packadd nvim.difftool")
vim.keymap.set("n", "<leader>u", require("undotree").open)

vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim", -- Shared package used in many place
	"https://github.com/nvim-tree/nvim-web-devicons", -- Shared package used in many place
	"https://github.com/magicduck/grug-far.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/hat0uma/csvview.nvim",
})

vim.api.nvim_create_autocmd("BufReadPost", {
	once = true,
	callback = function() require("gitsigns").setup({}) end,
})

require("csvview").setup({
	parser = { comments = { "#", "//" } },
	keymaps = {
		-- Text objects for selecting fields
		textobject_field_inner = { "if", mode = { "o", "x" } },
		textobject_field_outer = { "af", mode = { "o", "x" } },
		-- Excel-like navigation:
		-- Use <Tab> and <S-Tab> to move horizontally between fields.
		-- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
		-- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
		jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
		jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
		jump_next_row = { "<Enter>", mode = { "n", "v" } },
		jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
	},
})

vim.keymap.set("n", "<leader>csv", "<cmd>CsvViewEnable display_mode=border header_lnum=1<cr>")
