return {
	"rose-pine/neovim",
	enable = false,
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "moon",
			styles = {
				italic = false,
				-- transparency = true,
			},
		});

		-- vim.cmd("colorscheme rose-pine")
	end
}
