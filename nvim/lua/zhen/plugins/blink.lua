return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		{ "rafamadriz/friendly-snippets", lazy = true },
	},
	opts = {
		keymap = { preset = "default" },
		appearance = { nerd_font_variant = "mono" },
		signature = { enabled = true },
		completion = { documentation = { auto_show = true } },
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
