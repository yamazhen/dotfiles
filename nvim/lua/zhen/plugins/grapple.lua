return {
	"cbochs/grapple.nvim",
	opts = {
		scope = "git",
		icons = false,
		style = "basename",
	},
	keys = {
		{ "<leader><leader>", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
		{ "<C-e>", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
		{ "<C-n>", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
		{ "<C-p>", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
	},
}
