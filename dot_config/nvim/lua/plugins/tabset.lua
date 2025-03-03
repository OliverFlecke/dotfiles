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
					tabwidth = 4,
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
