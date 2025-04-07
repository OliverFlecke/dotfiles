return {
	'akinsho/bufferline.nvim',
	version = "*",
	enabled = true,
	lazy = false,
	-- event = "BufReadPre",
	dependencies = 'nvim-tree/nvim-web-devicons',
	keys = {
		{ '<Tab>',   '<Cmd>BufferLineCycleNext<CR>', desc = "Next buffer" },
		{ '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', desc = "Prev buffer" },
	},
	opts = {
		options = {
			show_buffer_close_icons = false,
			show_close_icon = false,
			color_icons = true,
			-- separator_style = 'slant',
		}
	},
}
