return {
	{
		"autotemplate",
		dir = "~/personal/autotemplate",
		config = function()
			require("autotemplate").setup()
		end,
	},
	{
		"indentconfig",
		dir = "~/personal/indentconfig.nvim",
		config = function()
			require("indentconfig").setup({
				filetype = {
					java = 4,
					typescriptreact = 2,
					javascript = 2,
					typescript = 2,
					javascriptreact = 2,
					html = 2,
					css = 2,
					python = 4,
					json = 2,
				},
			})
		end,
	},
}
