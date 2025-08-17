return {
	{
		"yetone/avante.nvim",
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		-- ⚠️ must add this setting! ! !
		build = function()
			-- conditionally use the correct build system for the current OS
			if vim.fn.has("win32") == 1 then
				return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
			else
				return "make"
			end
		end,
		event = "VeryLazy",
		enabled = false,
		version = false,
		opts = {
			provider = "ollama",
			providers = {
				ollama = {
					endpoint = "http://localhost:11434",
					model = "gemma3",
					-- model = "qwq:32b",
				},
			},
			-- provider = "claude",
			-- providers = {
			-- 	claude = {
			-- 		endpoint = "https://api.anthropic.com",
			-- 		model = "claude-sonnet-4-20250514",
			-- 		timeout = 30000,
			-- 		extra_request_body = {
			-- 			temperature = 0.75,
			-- 			max_tokens = 20480,
			-- 		},
			-- 	},
			-- },
			input = {
				provider = "snacks",
				provider_opts = {
					-- Additional snacks.input options
					title = "Avante Input",
					icon = " ",
				},
			},
			selector = {
				provider = "fzf",
				provider_opts = {},
			},

			-- Integration with mcphub (installed below)
			system_prompt = function()
				local hub = require("mcphub").get_hub_instance()
				return hub and hub:get_active_servers_prompt() or ""
			end,
			-- Using function prevents requiring mcphub before it's loaded
			custom_tools = function()
				return {
					require("mcphub.extensions.avante").mcp_tool(),
				}
			end,
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				'MeanderingProgrammer/render-markdown.nvim',
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},

	-- MCP Hub
	{
		"ravitemer/mcphub.nvim",
		enabled = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		build = "npm install -g mcp-hub@latest",
	},
}
