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
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				css = { "prettier" },
				lua = { "stylua" },
				html = { "prettier" },
				json = { "biome" },
				sql = { "sql-formatter" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			notify_on_error = true,
		})
	end,
}
