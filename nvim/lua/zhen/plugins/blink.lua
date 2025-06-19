return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "1.*",
	dependencies = {
		{ "rafamadriz/friendly-snippets", lazy = true },
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			config = function()
				require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets/" } })
				require("luasnip.loaders.from_vscode").lazy_load()
				local luasnip = require("luasnip")

				luasnip.config.set_config({
					region_check_events = "InsertEnter",
					delete_check_events = "InsertLeave",
				})
			end,
		},
	},
	opts = {
		keymap = { preset = "default" },
		appearance = { nerd_font_variant = "mono" },
		signature = { enabled = true },
		completion = { menu = { border = nil }, documentation = { auto_show = true } },
		snippets = { preset = "luasnip" },
		sources = {
			default = {
				"lsp",
				"snippets",
				"path",
				"buffer",
			},
			providers = {
				lsp = {
					min_keyword_length = 2,
				},
				buffer = {
					max_items = 3,
					min_keyword_length = 3,
				},
			},
		},
		fuzzy = {
			implementation = "rust",
		},
	},
	opts_extend = { "sources.default" },
}
