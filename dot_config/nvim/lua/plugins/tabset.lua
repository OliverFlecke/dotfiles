return {
	"FotiadisM/tabset.nvim",
	config = function()
		require("tabset").setup({
			defaults = {
				tabwidth = 4,
				expandtab = false,
			},
			languages = {
				lua = {
					tabwidth = 2,
				},
				{
					filetypes = {
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
					},
					config = {
						tabwidth = 2,
					}
				}
			}
		})
	end
}
