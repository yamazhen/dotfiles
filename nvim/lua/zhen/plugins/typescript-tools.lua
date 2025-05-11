return {
	"pmizio/typescript-tools.nvim",
	ft = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
	opts = {
		jsx_close_tag = {
			enable = true,
			filetypes = { "javascriptreact", "typescriptreact" },
		},
		expose_as_code_actio = { "all" },
		tsserver_file_preferences = {
			autoImportFileExcludePatterns = { "node_modules/*" },
		},
	},
}
