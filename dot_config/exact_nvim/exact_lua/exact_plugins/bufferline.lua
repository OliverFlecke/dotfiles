return {
	'akinsho/bufferline.nvim',
	version = "*",
	enabled = false,
	lazy = false,
	-- event = "BufReadPre",
	dependencies = 'nvim-tree/nvim-web-devicons',
	keys = {
		{ '<M-Tab>',   '<Cmd>BufferLineCycleNext<CR>', desc = "Next buffer" },
		{ '<M-S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', desc = "Prev buffer" },
	},
	opts = {
		options = {
			themable = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			color_icons = true,
			separator_style = 'thin',
		}
	},
}
