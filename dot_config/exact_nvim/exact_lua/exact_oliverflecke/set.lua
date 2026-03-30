vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.guicursor = ""

vim.opt.autoread = true
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = { 100 }

vim.g.mapleader = " "
vim.opt.listchars = {
	space = " ",
	-- tab = "» ",
	tab = "▏ ",
	trail = "-",
	-- eol = "↲",
}
vim.opt.list = true
vim.opt.formatoptions = { n = true, j = true, t = true }
vim.opt.wildignore = { "*.o", "*.a", "__pycache__", "node_modules", "bin/*", "obj/*" }

vim.opt.spelllang = "en-us"

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>W", ":%bd|e#<CR>")
-- vim.keymap.set("n", "<leader>", ":%bd<CR>")

-- Move lines up and down
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", '"_dP')

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>|", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>-", "<cmd>split<cr>")

-- Deleting to void register
-- vim.keymap.set("n", "<leader>d", "\"_d")
-- vim.keymap.set("v", "<leader>d", "\"_d")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Copy line down and comment current
vim.keymap.set(
	"n",
	"ycc",
	'"yy" . v:count1 . "gcc\']p"',
	{ remap = true, expr = true, desc = "Duplicate and comment lines" }
)

-- Paste current filename
vim.keymap.set("n", "<leader>pf", function()
	local filename = vim.fn.expand("%:t:r")
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_buf_set_text(0, row - 1, col + 1, row - 1, col + 1, { filename })
end)

vim.filetype.add({
	extension = {
		ftl = "html",
		-- mjml = "mjml",
		mjml = "html",
	},
})

-- Define comment string for SQL file types
vim.api.nvim_create_autocmd("FileType", {
	pattern = "sql",
	callback = function() vim.bo.commentstring = "-- %s" end,
})

-- -- Add borders to all floating preview windows
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
-- 	opts = opts or {}
-- 	opts.border = opts.border or 'rounded'
--
-- 	return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

vim.api.nvim_create_autocmd("LspProgress", {
	callback = function(ev)
		local value = ev.data.params.value or {}
		if not value.kind then
			return
		end

		local status = value.kind == "end" and 0 or 1
		local percent = value.percentage or 0

		local osc_seq = string.format("\27]9;4;%d;%d\a", status, percent)

		if os.getenv("TMUX") then
			osc_seq = string.format("\27Ptmux;\27%s\27\\", osc_seq)
		end

		io.stdout:write(osc_seq)
		io.stdout:flush()
	end,
})
