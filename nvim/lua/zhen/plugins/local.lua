return {
	{
		"scaffold.nvim",
		dir = "~/personal/scaffold.nvim",
		event = "VeryLazy",
		config = function()
			require("scaffold").setup()
		end,
	},
}
