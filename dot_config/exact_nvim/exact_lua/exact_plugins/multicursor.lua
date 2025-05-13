local mode = { "n", "x" }

return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	opts = {},
	keys = {
		-- Add or skip adding a new cursor by matching word/selection
		{ "<D-d>",        function() require("multicursor-nvim").matchAddCursor(1) end,    mode, desc = "Add cursor at next match" },
		{ "<D-S-d>",      function() require("multicursor-nvim").matchAddCursor(-1) end,   mode, desc = "Add cursor at prev match" },
		{ "<D-k><D-d>",   function() require("multicursor-nvim").matchSkipCursor(1) end,   mode, desc = "Skip cursor at next match" },
		{ "<D-k><D-S-d>", function() require("multicursor-nvim").matchSkipCursor(-1) end,  mode, desc = "Skip cursor at prev match" },
		-- Add cursor above or below the main cursor
		{ "<D-M-k>",      function() require("multicursor-nvim").lineAddCursor(-1) end,    mode, desc = "Add cursor above" },
		{ "<D-M-j>",      function() require("multicursor-nvim").lineAddCursor(1) end,     mode, desc = "Add cursor below" },
		{ "<D-M-S-k>",    function() require("multicursor-nvim").lineSkipCursor(-1) end,   mode, desc = "Add cursor above" },
		{ "<D-M-S-j>",    function() require("multicursor-nvim").lineSkipCursor(1) end,    mode, desc = "Add cursor below" },

		{ "<leader>D",    function() require("multicursor-nvim").matchAllAddCursors() end, mode, desc = "Add cursor at all matches in document" },
		{ "<left>",       function() require("multicursor-nvim").nextCursor() end,         mode, desc = "Rotate cursor next" },
		{ "<right>",      function() require("multicursor-nvim").prevCursor() end,         mode, desc = "Rotate cursor prev" },
		{ "<leader>d",    function() require("multicursor-nvim").deleteCursor() end,       mode, desc = "Delete main cursor" },

		{ "<leader>cr",   function() require("multicursor-nvim").restoreCursors() end,     mode, desc = "Restore cursors" },
		{ "<leader>ca",   function() require("multicursor-nvim").alignCursors() end,       mode, desc = "Align cursors" },

		{
			"<esc>",
			function()
				local mc = require("multicursor-nvim")
				if not mc.cursorsEnabled() then
					mc.enableCursors()
				elseif mc.hasCursors() then
					mc.clearCursors()
				else
					-- Default <esc> handler.
				end
			end,
			mode,
			desc = "Clear cursors if any"
		},

		{
			-- In normal/visual mode, press `mwap` will create a cursor in every match of
			-- the word captured by `iw` (or visually selected range) inside the bigger
			-- range specified by `ap`. Useful to replace a word inside a function, e.g. mwif.
			"mw",
			function()
				require("multicursor-nvim").operator({ motion = "iw", visual = true })
				-- Or you can pass a pattern, press `mwi{` will select every \w,
				-- basically every char in a `{ a, b, c, d }`.
				-- mc.operator({ pattern = [[\<\w]] })
			end,
			mode
		}
	},
}
