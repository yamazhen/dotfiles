return {
	"tpope/vim-fugitive",
	cmd = { "Git", "G", "Gwrite", "Gread", "Gstatus", "Gblame", "Gdiff", "Gvdiff" },
	keys = {
		{ "<leader>g", "<cmd>Git<cr>", desc = "Git status" },
	},
	config = function()
		local keymap = vim.keymap.set
		keymap("n", "gu", "<cmd>diffget //2<CR>")
		keymap("n", "gh", "<cmd>diffget //3<CR>")
		vim.opt.diffopt:append("vertical")

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "fugitive",
			callback = function()
				keymap("n", "<leader>p", function()
					vim.cmd("Git pull --rebase")
				end, { buffer = true })
			end,
		})
	end,
}
