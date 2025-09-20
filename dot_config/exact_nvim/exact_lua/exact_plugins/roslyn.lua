return {
	"seblyng/roslyn.nvim",
	-- Version after this is causing the Roslyn LSP to run many times, spending
	-- 100% CPU and responding very slowly. Will attempt to update later when
	-- newer versions has been published.
	commit = "1a4a5fbc74447b0926ded14979d381d3d7e74cb8",
	enabled = true,
	ft = "cs",
	opts = {},
}
