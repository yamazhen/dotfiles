return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.formatters["sql-formatter"] = {
			command = "sql-formatter",
			args = { "-l", "sqlite" },
		}
		conform.setup({
			formatters_by_ft = {
				python = { "black" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				lua = { "stylua" },
				html = { "prettier" },
				json = { "prettier" },
				sql = { "sql-formatter" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			notify_on_error = false,
		})
	end,
}
