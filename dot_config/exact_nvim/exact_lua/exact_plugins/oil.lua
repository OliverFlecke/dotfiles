local detail = false

return {
	'stevearc/oil.nvim',
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "-",          "<cmd>Oil<CR>", desc = "Toggle Oil" },
		{ "<leader>pv", "<cmd>Oil<CR>", desc = "Toggle Oil" },
	},
	opts = {
		view_options = {
			show_hidden = true,
		},
		skip_confirm_for_simple_edits = true,
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
