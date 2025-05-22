return {
	"folke/trouble.nvim",
	opts = {
		win = {
			type = "float",
		},
		focus = true,
		keys = {
			["<cr>"] = "jump_close",
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
