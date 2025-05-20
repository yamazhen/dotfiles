return {
	"cbochs/grapple.nvim",
	cmd = "Grapple",
	opts = {
		scope = "git",
		icons = false,
		status = false,
		style = "basename",
	},
	keys = {
		{ "<leader>a", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
		{ "<C-e>", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

		{ "<C-h>", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
		{ "<C-j>", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
		{ "<C-k>", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
		{ "<C-l>", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },

		{ "<leader><Tab>", "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
		{ "<leader><S-Tab>", "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
	},
}
