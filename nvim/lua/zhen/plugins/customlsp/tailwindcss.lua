vim.lsp.config("tailwindcss", {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"typescriptreact",
		"typescript",
		"javascript",
		"javascriptreact",
		"css",
		"scss",
		"html",
		"vue",
		"svelte",
		"astro",
	},
	root_markers = { "tailwind.config.js", "tailwind.config.ts", "package.json", ".git" },
	settings = {
		tailwindCSS = {
			validate = true,
		},
	},
})
vim.lsp.enable("tailwindcss")
