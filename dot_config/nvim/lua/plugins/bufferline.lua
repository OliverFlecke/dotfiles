return {
	'akinsho/bufferline.nvim',
	version = "*",
	enabled = true,
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require("bufferline").setup({
			options = {
				show_buffer_close_icons = false,
				show_close_icon = false,
				color_icons = true,
				separator_style = 'slant',
			}
		})

		vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
		vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
	end
}
