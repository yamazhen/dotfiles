return {
	"leath-dub/snipe.nvim",
	keys = {
		{
			"<leader>ss",
			function()
				require("snipe").open_buffer_menu()
			end,
			desc = "Open Snipe buffer menu",
		},
	},
	opts = {
		ui = {
			position = "center",
			text_align = "file-first",
		},
		hints = {
			dictionary = "1234567890",
		},
	},
}
