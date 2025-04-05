-- Configuration for showing diagnostics

local with_virtual_lines_config = {
	virtual_text = {
		severity = {
			max = vim.diagnostic.severity.WARN,
		},
	},
	virtual_lines = {
		current_line = true,
		severity = {
			min = vim.diagnostic.severity.ERROR,
		},
	},
}

local no_virtual_lines_config = {
	virtual_text = true,
	virtual_lines = false,
}

vim.diagnostic.config(with_virtual_lines_config)
local use_virtual_lines = true

vim.keymap.set("n", "gK", function()
	use_virtual_lines = not use_virtual_lines
	vim.diagnostic.config(use_virtual_lines
		and with_virtual_lines_config
		or no_virtual_lines_config)
end, { desc = "Toggle diagnostic virtual_lines" })
