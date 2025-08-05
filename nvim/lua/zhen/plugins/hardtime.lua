return {
	"m4xshen/hardtime.nvim",
	lazy = false,
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		max_count = 1,
	},
	keys = {
		{ "<C-h>", "<cmd>HardtimeToggle<cr>", desc = "Toggle Hardtime" },
	},
}
