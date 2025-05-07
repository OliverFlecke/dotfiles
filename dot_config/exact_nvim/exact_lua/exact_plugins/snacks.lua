return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	keys = {
		-- git
		{ "<leader>gb",      function() Snacks.picker.git_branches() end, desc = "Git Branches" },
		{ "<leader>gl",      function() Snacks.picker.git_log() end,      desc = "Git Log" },
		{ "<leader>gL",      function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
		{ "<leader>gs",      function() Snacks.picker.git_status() end,   desc = "Git Status" },
		{ "<leader>gS",      function() Snacks.picker.git_stash() end,    desc = "Git Stash" },
		{ "<leader>gd",      function() Snacks.picker.git_diff() end,     desc = "Git Diff (Hunks)" },
		{ "<leader>gf",      function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
		{ "<leader>lg",      function() Snacks.lazygit.open() end,        desc = "Open LazyGit" },

		{ "<leader><space>", function() Snacks.picker.smart() end,        desc = "Smart Find Files" },
		{ "<leader>f",       function() Snacks.picker.files() end,        desc = "Find Files" },
		{ "<leader>,",       function() Snacks.picker.buffers() end,      desc = "Buffers" },
		{ "<leader>/",       function() Snacks.picker.grep() end,         desc = "Grep" },

		-- Grep
		{ "<leader>sb",      function() Snacks.picker.lines() end,        desc = "Buffer Lines" },
		{ "<leader>sB",      function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
		{ "<leader>sg",      function() Snacks.picker.grep() end,         desc = "Grep" },
		{ "<leader>sw",      function() Snacks.picker.grep_word() end,    desc = "Visual selection or word", mode = { "n", "x" } },
	},
	opts = {
		input = {},
		animate = {},
		picker = {},
		lazygit = {},

		dashboard = {
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{
					pane = 2,
					icon = " ",
					desc = "Browse Repo",
					padding = 1,
					key = "b",
					enabled = function() return Snacks.git.get_root() ~= nil end,
					action = function() Snacks.gitbrowse() end,
				},
				function()
					local in_git = Snacks.git.get_root() ~= nil
					local cmds = {
						{
							icon = " ",
							title = "Open PRs",
							cmd = "gh pr list -L 3",
							key = "P",
							action = function()
								vim.fn.jobstart("gh pr list --web", { detach = true })
							end,
							height = 10,
						},
						{
							title = "Open Issues",
							cmd = "gh issue list -L 3",
							key = "i",
							action = function()
								vim.fn.jobstart("gh issue list --web", { detach = true })
							end,
							icon = " ",
							height = 15,
						},
						{
							icon = " ",
							title = "Git Status",
							cmd = "git --no-pager diff --stat -B -M -C",
							height = 10,
						},
					}
					return vim.tbl_map(function(cmd)
						return vim.tbl_extend("force", {
							pane = 2,
							section = "terminal",
							enabled = in_git,
							padding = 1,
							ttl = 5 * 60,
							indent = 3,
						}, cmd)
					end, cmds)
				end,
				{ section = "startup" },
			},
		},
	}
}
