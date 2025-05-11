return {
	-- Debugging tools for embedded languages (C++, Rust)
	-- You need to have lldb-dap installed (have previously been known as lldb-vscode).
	-- On macOS, there are two options
	-- 1. It currently comes installed with xcode and can be found with `xcrun -f lldb-dap``
	-- 2. It is part of llvm tools, and can be installed with `brew install llvm`.
	--   The executable is then under `$(brew --prefix llvm)/bin/lldb-dap`. Should
	--   give you something like `/opt/homebrew/opt/llvm/bin/lldb-dap`
	{
		"mfussenegger/nvim-dap",
		keys = {
			{ "<leader>rr", "<cmd>DapNew<CR>" },
			{ "<leader>rx", "<cmd>DapTerminate<CR>" },
			{ "<leader>rt", function() require("dap").run_last() end },

			{ "<leader>rb", "<cmd>DapToggleBreakpoint<CR>" },
			{ "<leader>rc", "<cmd>DapContinue<CR>" },
			{ "<leader>ri", "<cmd>DapStepInto<CR>" },
			{ "<leader>ro", "<cmd>DapStepOver<CR>" },
			{ "<leader>ru", "<cmd>DapStepOut<CR>" },
		},
		config = function()
			local dap = require('dap')

			dap.adapters.lldb = {
				type = 'executable',
				-- Update as needed. MUST be absolute path.
				command = '/opt/homebrew/opt/llvm/bin/lldb-dap',
				name = 'lldb'
			}
			dap.configurations.rust = {
				{
					name = 'Launch',
					type = 'lldb',
					request = 'launch',
					program = function()
						local path = vim.fn.getcwd();
						local name = vim.fn.substitute(path, '^.*/', '', '')
						return path .. "/target/debug/" .. name

						-- This will ask for the executable path every time
						-- return vim.fn.input('Path to executable: ', vim.fn.getcwd(), 'file')
					end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
					justMyCode = true,
					console = 'integratedTerminal',
					args = {},

					-- Rust types
					initCommands = function()
						-- Find out where to look for the pretty printer Python module.
						local rustc_sysroot = vim.fn.trim(vim.fn.system 'rustc --print sysroot')
						assert(
							vim.v.shell_error == 0,
							'failed to get rust sysroot using `rustc --print sysroot`: '
							.. rustc_sysroot
						)
						local script_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py'
						local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'
						return {
							([[!command script import '%s']]):format(script_file),
							([[command source '%s']]):format(commands_file),
						}
					end,
				},
			}
		end
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		opts = {
			virt_text_pos = 'eol',
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		opts = {},
	}
}
