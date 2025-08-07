return {
	"stevearc/oil.nvim",
	keys = {
		{ "<leader>ee", "<CMD>Oil --float<CR>", desc = "Open file explorer" },
	},
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},
			float = {
				max_width = 0.6,
				max_height = 0.6,
			},
			keymaps = {
				["q"] = { "actions.close", mode = "n" },
			},
		})
	end,
}
