return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = { "saghen/blink.compat" },
	opts = function()
		return {
			sources = {
				default = { "obsidian", "obsidian_new", "obsidian_tags" },
				providers = {
					obsidian = {
						name = "obsidian",
						module = "blink.compat.source",
					},
					obsidian_new = {
						name = "obsidian_new",
						module = "blink.compat.source",
					},
					obsidian_tags = {
						name = "obsidian_tags",
						module = "blink.compat.source",
					},
				},
			},
			fuzzy = {
				implementation = "rust",
			},
		}
	end,
	opts_extend = { "sources.default" },
}
