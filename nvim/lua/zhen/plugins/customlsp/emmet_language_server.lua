vim.lsp.config("emmet_language_server", {
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
vim.lsp.enable("emmet_language_server")
