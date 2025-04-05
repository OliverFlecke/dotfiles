return {
	'arnamak/stay-centered.nvim',
	opts = {},
	config = function(_, opts)
		require('stay-centered').setup(opts)

		vim.keymap.set({ 'n', 'v' }, '<leader>st', require('stay-centered').toggle, { desc = 'Toggle stay-centered.nvim' })
	end
}
