return {
	"mbbill/undotree",
	branch = "master",
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
	end
}
