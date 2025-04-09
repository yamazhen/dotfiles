return {
	"cbochs/grapple.nvim",
	opts = {
		scope = "git",
		icons = false,
		status = false,
	},
	keys = {
		{ "<leader>a", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
		{ "<leader>n", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

		{ "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
		{ "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
		{ "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
		{ "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },

		{ "<leader>[s", "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
		{ "<leader>[a", "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
	},
}
