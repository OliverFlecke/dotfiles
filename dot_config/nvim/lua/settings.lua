-- General vim settings

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.bo.expandtab = false
vim.bo.autoindent = true
vim.o.encoding = "utf-8"

vim.o.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"

vim.api.nvim_set_keymap("", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-f>", "<Esc>:lua vim.lsp.buf.formatting()<CR>", { silent = true })
