return {
	"Chaitanyabsprip/fastaction.nvim",
	opts = {
		keys = "1234567890",
		popup = {
			border = "single",
			title = nil,
		},
	},
	keys = {
		{ "<leader>si", "<cmd>lua require('fastaction').code_action()<cr>", desc = "Fast Action" },
	},
}
