return {
	{
		"scaffold.nvim",
		dir = "~/personal/scaffold.nvim",
		event = "VeryLazy",
		config = function()
			require("scaffold").setup()
		end,
	},
	{
		"oyen.nvim",
		dir = "~/personal/oyen.nvim",
		config = function()
			require("oyen").setup({
				path_display = {
					mode = "project",
				},
			})
		end,
	},
}
