return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
	},

	keys = {
		-- { '<leader>pf', require('telescope.builtin').find_files, desc = 'Telescope find files' },
		{ '<C-p>', require('telescope.builtin').git_files, desc = 'Telescope find files' },
		{
			'<leader>ps',
			function()
				require('telescope.builtin').grep_string({ search = vim.fn.input("grep > ") });
			end,
			desc = "Grep strings"
		},
		{
			"<leader>en",
			function()
				require('telescope.builtin').find_files {
					cwd = vim.fn.stdpath('config')
				}
			end,
			desc = "Search nvim config",
		}
	},
}
