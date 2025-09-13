require("mini.deps").now(function()
	require("rose-pine").setup({ styles = { transparency = true, italic = false } })
	vim.cmd("colorscheme rose-pine-moon")

	vim.opt.diffopt:append("vertical")

	require("oil").setup({ view_options = { show_hidden = true } })

	require("fzf-lua").setup({ "ivy", winopts = { border = "none", preview = { hidden = true } } })
end)

require("mini.deps").later(function()
	require("mason").setup({
		registries = {
			"github:nvim-java/mason-registry",
			"github:mason-org/mason-registry",
		},
	})

	require("blink.cmp").setup({ snippets = { preset = "luasnip" } })

	require("luasnip.loaders.from_lua").load({ paths = { "./snippets" } })
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip").config.set_config({
		region_check_events = "InsertEnter",
		delete_check_events = "InsertLeave",
	})

	require("nvim-treesitter.configs").setup({
		highlight = {
			enable = true,
		},
		auto_install = true,
		indent = { enable = true },
		modules = {},
		ensure_installed = "",
		sync_install = false,
		ignore_install = {},
	})

	require("mason-lspconfig").setup({})

	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			typescript = { "prettierd" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
	})
end)
