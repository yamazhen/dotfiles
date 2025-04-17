return {
	"Chaitanyabsprip/fastaction.nvim",
	opts = {
		keys = "1234567890",
		popup = {
			border = "single",
			title = nil,
		},
		register_ui_select = true,
	},
	keys = {
		{ "<leader>si", "<cmd>lua require('fastaction').code_action()<cr>", desc = "Fast Action" },
	},
}
