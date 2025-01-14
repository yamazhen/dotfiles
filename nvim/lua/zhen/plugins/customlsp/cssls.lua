local lspconfig = require("lspconfig")

lspconfig.cssls.setup({
	settings = {
		css = {
			lint = {
				unknownAtRules = "ignore",
			},
		},
	},
})
