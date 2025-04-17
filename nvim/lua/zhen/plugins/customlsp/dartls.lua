vim.lsp.config("dartls", {
	cmd = { "dart", "language-server", "--protocol=lsp" },
	capabilities = {
		textDocument = {
			diagnostic = {
				relatedInformation = true,
			},
		},
	},
})
vim.lsp.enable("dartls")
