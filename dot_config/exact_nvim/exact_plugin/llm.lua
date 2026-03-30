vim.pack.add({ "https://github.com/supermaven-inc/supermaven-nvim" })

vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	callback = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<C-t>",
			},
		})
	end,
})
