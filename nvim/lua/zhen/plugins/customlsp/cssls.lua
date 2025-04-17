vim.lsp.config("cssls", {
	settings = {
		css = {
			lint = {
				unknownAtRules = "ignore",
			},
		},
	},
})

vim.lsp.enable("cssls")
