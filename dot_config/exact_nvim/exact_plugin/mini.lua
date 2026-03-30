vim.pack.add({
	"https://github.com/echasnovski/mini.move",
	"https://github.com/echasnovski/mini.surround",
})

-- This is not working fulling as expected. The `sa` works, but the rest does not
require("mini.surround").setup()
-- Keymaps:
-- add `sa`
-- delete `sd`
-- replace `sr`
-- find `sf` or `sF`
-- highlight `sh`
-- change number of neighbor lines `sn`

require("mini.move").setup({
	mappings = {
		-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
		left = "<M-h>",
		right = "<M-l>",
		down = "<M-j>",
		up = "<M-k>",

		-- Move current line in Normal mode
		line_left = "<M-h>",
		line_right = "<M-l>",
		line_down = "<M-j>",
		line_up = "<M-k>",
	},

	-- Options which control moving behavior
	options = {
		reindent_linewise = true,
	},
})
