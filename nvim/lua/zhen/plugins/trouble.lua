return {
	"folke/trouble.nvim",
	opts = {
		win = {
			type = "float",
			border = "single",
		},
		focus = true,
		auto_preview = false,
		keys = {
			["<cr>"] = "jump_close",
			["q"] = "close",
		},
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>tt",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>td",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
	},
}
