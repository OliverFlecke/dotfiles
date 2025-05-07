-- Configuration for showing diagnostics

local with_virtual_lines_config = {
	virtual_text = {
		severity = {
			-- max = vim.diagnostic.severity.WARN,
			min = vim.diagnostic.severity.WARN,
		},
	},
	virtual_lines = {
		current_line = true,
		severity = {
			min = vim.diagnostic.severity.INFO,
		},
	},
}

local no_virtual_lines_config = {
	virtual_text = true,
	virtual_lines = false,
}
local use_virtual_lines = false

vim.diagnostic.config(use_virtual_lines
	and with_virtual_lines_config
	or no_virtual_lines_config)

vim.keymap.set("n", "gK", function()
	use_virtual_lines = not use_virtual_lines
	vim.diagnostic.config(use_virtual_lines
		and with_virtual_lines_config
		or no_virtual_lines_config)
end, { desc = "Toggle diagnostic virtual_lines" })

local goto_next_error = { severity = vim.diagnostic.severity.ERROR, wrap = true }
vim.keymap.set("n", "]g", function() vim.diagnostic.goto_next(goto_next_error) end)
vim.keymap.set("n", "[g", function() vim.diagnostic.goto_prev(goto_next_error) end)
