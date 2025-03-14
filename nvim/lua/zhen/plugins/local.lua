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
					typescriptreact = 2,
					javascript = 2,
					typescript = 2,
					javascriptreact = 2,
					html = 2,
					css = 2,
					json = 2,
					jsonc = 2,
					dart = 2,
					swift = 2,
					yaml = 2,
				},
			})
		end,
	},
}
