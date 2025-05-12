return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- adapters
			"Issafalcon/neotest-dotnet",
			"rouge8/neotest-rust",
		},
		keys = {
			{ "<leader>tr",  function() require("neotest").run.run() end,                        desc = "Run test" },
			{ "<leader>tR",  function() require("neotest").run.run(vim.fn.expand("%")) end,      desc = "Run all tests in file" },
			{ "<leader>td",  function() require("neotest").run.run({ strategy = "dap" }) end,    desc = "Debug nearest test" },
			{ "<leader>tx",  function() require("neotest").run.stop() end,                       desc = "Stop test" },

			{ "<leader>ts",  function() require("neotest").summary.toggle() end,                 desc = "Toggle test summary" },
			{ "<leader>to",  function() require("neotest").output_panel.toggle() end,            desc = "Toggle output panel" },
			{ "<leader>tc",  function() require("neotest").output_panel.clear() end,             desc = "Clear output panel" },

			{ "<leader>t[n", function() require("neotest").jump.prev({ status = "failed" }) end, desc = "Jump to prev failed test" },
			{ "<leader>t]n", function() require("neotest").jump.next({ status = "failed" }) end, desc = "Jump to next failed test" },
		},
		config = function()
			local config = {
				diagnostic = {
					enabled = true,
					virtual_text = {
						severity = {
							min = vim.diagnostic.severity.WARN,
						},
					},
				},
				status = {
					enabled = true,
					signs = true,
					virtual_text = false,
				},
				discovery = {
					-- Drastically improve performance in ginormous projects by
					-- only AST-parsing the currently opened buffer.
					enabled = false,
					-- Number of workers to parse files concurrently.
					-- A value of 0 automatically assigns number based on CPU.
					-- Set to 1 if experiencing lag.
					concurrent = 1,
				},
				running = {
					concurrent = true, -- Run tests concurrently when an adapter provides multiple commands to run.
				},
				summary = {
					animated = false, -- Enable/disable animation of icons.
				},

				adapters = {
					require("neotest-dotnet"),
					require("neotest-rust") {
						args = { "--no-capture" },
						dap_adapter = "lldb",
					},
				},
			}

			require("neotest").setup(config)

			-- Not sure if this is actually working or not. Tested with Rust adapter
			-- where nothing is showing up.
			local ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({ virtual_text = true }, ns)
		end,
	},
}
