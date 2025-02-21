return {
	'echasnovski/mini.surround',
	version = false,
	config = function()
		require("mini.surround").setup()

		-- Shortcuts:
		-- add `sa`
		-- delete `sd`
		-- replace `sr`
		-- find `sf` or `sF`
		-- highlight `sh`
		-- change number of neighor lines `sn`
	end
}
