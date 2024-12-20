return {
	{
		"saghen/blink.cmp",
		lazy = false,
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
			{ "L3MON4D3/LuaSnip", version = "2.*" },
		},
		version = "v0.*",
		opts = {
			snippets = {
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			completion = {
				accept = {
					auto_brackets = { enabled = true },
				},
				menu = { border = "single" },
				documentation = {
					auto_show_delay_ms = 0,
					auto_show = true,
					window = {
						border = "single",
						scrollbar = false,
					},
				},
			},
			keymap = {
				["<Tab>"] = {
					function(cmp)
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
				["<S-Tab>"] = {
					function()
						local copilot = require("copilot.suggestion")
						if copilot.is_visible() then
							copilot.accept()
						end
					end,
				},
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
			},
			sources = {
				completion = {
					enabled_providers = {
						"luasnip",
						"lsp",
						"buffer",
						"path",
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true,
			})
		end,
	},
	-- autotag
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	-- auto indent
	{ "Darazaki/indent-o-matic" },
}
