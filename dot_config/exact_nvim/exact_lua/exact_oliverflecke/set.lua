vim.opt.guicursor = ""

vim.opt.autoread = true
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = { 80 }

vim.g.mapleader = " "
vim.opt.listchars = {
	space = ' ',
	tab = '» ',
	trail = '-',
	-- eol = "↲",
}
vim.opt.list = true
vim.opt.formatoptions = { n = true, j = true, t = true }
vim.opt.wildignore = { '*.o', '*.a', '__pycache__', 'node_modules', 'bin/*', 'obj/*' }

-- vim.opt.spelllang = "en-us"

vim.filetype.add({
	extension = {
		ftl = 'html',
		mjml = 'mjml',
	},
})

-- Define comment string for SQL file types
vim.api.nvim_create_autocmd("FileType", {
	pattern = "sql",
	callback = function()
		vim.bo.commentstring = "-- %s"
	end
})

-- Add borders to all floating preview windows
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or 'rounded'

	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
