return {
	"pmizio/typescript-tools.nvim",
	ft = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
	opts = {
		jsx_close_tag = {
			enable = true,
		},
		separate_diagnostic_server = true,
		complete_function_calls = true,
		tsserver_file_preferences = {
			autoImportFileExcludePatterns = { "node_modules/*" },
		},
	},
}
