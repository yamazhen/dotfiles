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
			enabled = function()
				return not vim.tbl_contains({ "snacks_picker_input" }, vim.bo.filetype)
			end,
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
				menu = { border = "single" },
				documentation = {
					auto_show_delay_ms = 0,
					auto_show = true,
					treesitter_highlighting = true,
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
				default = {
					"lsp",
					"snippets",
					"buffer",
					"path",
				},
			},
		},
		opts_extend = { "sources.default" },
	},
	-- autotag
	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "xml" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = false,
					enable_close_on_slash = true,
				},
			})
		end,
	},
	-- autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
}
