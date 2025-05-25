return {
	"tpope/vim-fugitive",
	config = function()
		local keymap = vim.keymap.set
		keymap("n", "<leader>gs", vim.cmd.Git)
		keymap("n", "gu", "<cmd>diffget //2<CR>")
		keymap("n", "gh", "<cmd>diffget //3<CR>")

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "fugitive",
			callback = function()
				keymap("n", "<leader>P", function()
					-- let me try to use fugitive first
					vim.cmd.Git({ "pull", "--rebase" })
				end)
			end,
		})
	end,
}
