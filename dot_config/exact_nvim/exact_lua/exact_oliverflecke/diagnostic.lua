-- Configuration for showing diagnostics

vim.diagnostic.config({
	update_in_insert = true,
	underline = true,
	-- severity_sort = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '',
			[vim.diagnostic.severity.WARN] = '',
			[vim.diagnostic.severity.HINT] = '',
			[vim.diagnostic.severity.INFO] = '',
		},
	},
	float = {
		border = 'rounded',
		-- source = 'always',
		header = '',
		prefix = '',
	},
})

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
	virtual_text = {
		severity = {
			min = vim.diagnostic.severity.WARN,
		}
	},
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

vim.keymap.set("n", "]g",
	function()
		vim.diagnostic.jump({
			severity = vim.diagnostic.severity.ERROR,
			count = -1,
			wrap = true
		})
	end)
vim.keymap.set("n", "[g", function()
	vim.diagnostic.jump({
		severity = vim.diagnostic.severity.ERROR,
		count = 1,
		wrap = true
	})
end)
