local lspconfig = require("lspconfig")

lspconfig.emmet_language_server.setup({
	filetypes = { "html", "css", "typescriptreact", "javascriptreact" },
	settings = {
		emmet = {
			showExpandedAbbreviation = "always",
			showAbbreviationSuggestions = true,
			showSuggestionsAsSnippets = true,
		},
	},
	init_options = {
		preferences = {
			["bem.enabled"] = true,
		},
	},
})
