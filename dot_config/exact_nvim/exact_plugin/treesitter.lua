vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
})

local treesitter = require("nvim-treesitter")
treesitter.setup({
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true },
	-- incremental_selection = {
	-- 	enable = true,
	-- 	keymaps = {
	-- 		init_selection = "<C-space>",
	-- 		node_incremental = "<C-space>",
	-- 		scope_incremental = false,
	-- 		node_decremental = "<bs>",
	-- 	},
	-- },
})

local ensureInstalled = {
	"javascript",
	"typescript",
	"tsx",
	"c_sharp",
	"rust",
	"lua",
	"vim",
	"vimdoc",
	"markdown",
	"markdown_inline",
	"python",
	"go",
	"dockerfile",
	"gitignore",
}

local alreadyInstalled = require("nvim-treesitter.config").get_installed()
local parsersToInstall = vim.iter(ensureInstalled)
	:filter(function(parser) return not vim.tbl_contains(alreadyInstalled, parser) end)
	:totable()
require("nvim-treesitter").install(parsersToInstall)

require("treesitter-context").setup({
	multiline_threshold = 1,
})
vim.keymap.set("n", "<leader>ct", "<cmd>TSContextToggle<cr>", { desc = "Toggle treesitter context" })

require("nvim-treesitter-textobjects").setup({
	select = {
		lookahead = true,
	},
	move = {
		set_jumps = true,
	},
})

local text_select = require("nvim-treesitter-textobjects.select")
vim.keymap.set({ "x", "o" }, "am", function() text_select.select_textobject("@function.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "im", function() text_select.select_textobject("@function.inner", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ac", function() text_select.select_textobject("@class.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ic", function() text_select.select_textobject("@class.inner", "textobjects") end)
-- You can also use captures from other query groups like `locals.scm`
vim.keymap.set({ "x", "o" }, "as", function() text_select.select_textobject("@local.scope", "locals") end)

local swap = require("nvim-treesitter-textobjects.swap")
vim.keymap.set("n", "<leader>np", function() swap.swap_next("@parameter.inner") end, { desc = "Swap next parameter" })
vim.keymap.set(
	"n",
	"<leader>pp",
	function() swap.swap_previous("@parameter.inner") end,
	{ desc = "Swap previous parameter" }
)
vim.keymap.set("n", "<leader>nm", function() swap.swap_next("@function.inner") end, { desc = "Swap next method" })
vim.keymap.set(
	"n",
	"<leader>pm",
	function() swap.swap_previous("@function.inner") end,
	{ desc = "Swap previous method" }
)

local move = require("nvim-treesitter-textobjects.move")

vim.keymap.set({ "n", "x", "o" }, "]m", function() move.goto_next_start("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "]]", function() move.goto_next_start("@class.outer", "textobjects") end)
-- You can also pass a list to group multiple queries.
vim.keymap.set(
	{ "n", "x", "o" },
	"]o",
	function() move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects") end
)
-- You can also use captures from other query groups like `locals.scm` or `folds.scm`
vim.keymap.set({ "n", "x", "o" }, "]s", function() move.goto_next_start("@local.scope", "locals") end)
vim.keymap.set({ "n", "x", "o" }, "]z", function() move.goto_next_start("@fold", "folds") end)

vim.keymap.set({ "n", "x", "o" }, "]M", function() move.goto_next_end("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "][", function() move.goto_next_end("@class.outer", "textobjects") end)

vim.keymap.set({ "n", "x", "o" }, "[m", function() move.goto_previous_start("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[[", function() move.goto_previous_start("@class.outer", "textobjects") end)

vim.keymap.set({ "n", "x", "o" }, "[M", function() move.goto_previous_end("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[]", function() move.goto_previous_end("@class.outer", "textobjects") end)

-- Go to either the start or the end, whichever is closer.
-- Use if you want more granular movements
vim.keymap.set({ "n", "x", "o" }, "]d", function() move.goto_next("@conditional.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[d", function() move.goto_previous("@conditional.outer", "textobjects") end)

local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

-- Repeat movement with ; and ,
-- -- ensure ; goes forward and , goes backward regardless of the last direction
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
