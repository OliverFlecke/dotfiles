vim.pack.add({
	"https://github.com/joosepalviste/nvim-ts-context-commentstring",
	"https://github.com/windwp/nvim-ts-autotag",
})

require("ts_context_commentstring").setup({
	enable_autocmd = false,
})
vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	callback = function() require("nvim-ts-autotag").setup() end,
})

local get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
	return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
		or get_option(filetype, option)
end
