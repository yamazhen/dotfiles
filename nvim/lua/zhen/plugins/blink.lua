return {
	"saghen/blink.cmp",
	version = "*",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		{ "rafamadriz/friendly-snippets" },
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
	},
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
		fuzzy = { implementation = "prefer_rust_with_warning" },
		completion = {
			documentation = {
				auto_show_delay_ms = 1000,
				auto_show = true,
				treesitter_highlighting = false,
				window = {
					scrollbar = true,
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
		},
		sources = {
			default = {
				"lsp",
				"snippets",
				"buffer",
				"path",
			},
		},
	},
	opts_extend = { "sources.default" },
}
