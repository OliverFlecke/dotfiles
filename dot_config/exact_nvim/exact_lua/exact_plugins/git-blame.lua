return {
	"f-person/git-blame.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>gB", "<cmd>GitBlameToggle<cr>", desc = "Toggle git blame" },
	},
	opts = {
		enabled = false, -- Don't want this turned on by default.
	},
}
