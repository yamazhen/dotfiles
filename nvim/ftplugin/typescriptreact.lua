vim.pack.add({ { src = "https://github.com/pmizio/typescript-tools.nvim" } })
vim.pack.add({ { src = "https://github.com/nvim-lua/plenary.nvim" } })

require("typescript-tools").setup({
	settings = {
		tsserver_plugins = {
			"@styled/typescript-styled-plugin",
		},
	},
})
