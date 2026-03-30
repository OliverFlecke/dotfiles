vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
})

require("nvim-treesitter").setup({
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
})
require("nvim-treesitter").install({
	-- "javascript",
	-- "typescript",
	-- "rust",
	-- "lua",
	-- "vim",
	-- "vimdoc",
	-- "markdown",
	-- "markdown_inline",
	-- "python",
	-- "go",
})

require("treesitter-context").setup({
	multiline_threshold = 1,
})
vim.keymap.set("n", "<leader>ct", "<cmd>TSContextToggle<cr>", { desc = "Toggle treesitter context" })
