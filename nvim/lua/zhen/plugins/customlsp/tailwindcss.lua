local lspconfig = require("lspconfig")

lspconfig.tailwindcss.setup({
	filetypes = {
		"typescriptreact",
		"typescript",
		"javascript",
		"javascriptreact",
		"css",
		"scss",
		"html",
		"vue",
	},
	root_dir = lspconfig.util.root_pattern(
		"tailwind.config.js",
		"tailwind.config.cjs",
		"postcss.config.js",
		"package.json"
	),
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					"tw`([^`]*)",
					'tw="([^"]*)',
					'className="([^"]*)',
				},
			},
		},
	},
})
