local detail = false

return {
	'stevearc/oil.nvim',
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>pv", "<cmd>Oil<CR>", desc = "Toggle Oil" },
	},
	opts = {
		keymaps = {
			["gd"] = {
				desc = "Toggle file detail view",
				callback = function()
					detail = not detail
					if detail then
						require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
					else
						require("oil").set_columns({ "icon" })
					end
				end,
			},
		},
	},
}
