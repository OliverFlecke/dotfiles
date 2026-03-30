vim.pack.add({ { src = "https://github.com/jake-stewart/multicursor.nvim", version = "1.0" } })

local mc = require("multicursor-nvim")
mc.setup()

local set = vim.keymap.set
-- Add or skip adding a new cursor by matching word/selection
set({ "n", "x" }, "<M-d>", function() mc.matchAddCursor(1) end, { desc = "Add cursor at next match" })
set({ "n", "x" }, "<M-S-d>", function() mc.matchAddCursor(-1) end, { desc = "Add cursor at prev match" })
set({ "n", "x" }, "<M-k><M-d>", function() mc.matchSkipCursor(1) end, { desc = "Skip cursor at next match" })
set({ "n", "x" }, "<M-k><M-S-d>", function() mc.matchSkipCursor(-1) end, { desc = "Skip cursor at prev match" })
-- Add cursor above or below the main cursor
set({ "n", "x" }, "<C-M-k>", function() mc.lineAddCursor(-1) end, { desc = "Add cursor above" })
set({ "n", "x" }, "<C-M-j>", function() mc.lineAddCursor(1) end, { desc = "Add cursor below" })
set({ "n", "x" }, "<D-M-S-k>", function() mc.lineSkipCursor(-1) end, { desc = "Add cursor above" })
set({ "n", "x" }, "<D-M-S-j>", function() mc.lineSkipCursor(1) end, { desc = "Add cursor below" })

set({ "n", "x" }, "<leader>D", function() mc.matchAllAddCursors() end, { desc = "Add cursor at all matches" })

set({ "n", "x" }, "<esc>", function()
	if not mc.cursorsEnabled() then
		mc.enableCursors()
	elseif mc.hasCursors() then
		mc.clearCursors()
	else
		-- Default <esc> handler.
	end
end, { desc = "Clear cursors if any" })
