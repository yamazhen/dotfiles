local lspconfig = require("lspconfig")

lspconfig.dartls.setup({
	cmd = { "dart", "language-server", "--protocol=lsp" },
})
