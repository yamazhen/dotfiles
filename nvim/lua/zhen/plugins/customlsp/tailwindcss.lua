vim.lsp.config("tailwindcss", {
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
	root_dir = function(fname)
		local match = vim.fs.find("package.json", {
			upward = true,
			path = vim.fs.dirname(fname),
		})[1]

		if match then
			return vim.fs.dirname(match)
		end

		return nil
	end,
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
vim.lsp.enable("tailwindcss")
