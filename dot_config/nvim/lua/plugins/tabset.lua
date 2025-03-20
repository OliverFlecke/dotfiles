return {
	"FotiadisM/tabset.nvim",
	config = function()
		require("tabset").setup({
			defaults = {
				tabwidth = 4,
				expandtab = false,
			},
			languages = {
				yaml = {
					expandtab = true
				},
				lua = {
					tabwidth = 2,
				},
				{
					filetypes = {
						"html",
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
