return {
	'echasnovski/mini.nvim',
	version = false,
	config = function()
		require('mini.sessions').setup({
			autoread = true,
			file = 'session.vim',
			-- directory = "~/.cache/nvim/session",
		})
	end
}
