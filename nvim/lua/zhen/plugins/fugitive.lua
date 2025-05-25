return {
	"tpope/vim-fugitive",
	config = function()
		local keymap = vim.keymap.set
		keymap("n", "<leader>g", vim.cmd.Git)
		keymap("n", "gu", "<cmd>diffget //2<CR>")
		keymap("n", "gh", "<cmd>diffget //3<CR>")

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "fugitive",
			callback = function()
				keymap("n", "q", "<cmd>close<CR>", { buffer = true })
				keymap("n", "<leader>p", function()
					vim.cmd.Git({ "pull", "--rebase" })
				end)
			end,
		})
	end,
}
