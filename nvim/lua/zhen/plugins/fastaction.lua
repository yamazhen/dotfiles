return {
	"Chaitanyabsprip/fastaction.nvim",
	config = function()
		require("fastaction").setup({
			register_ui_select = true,
		})
		vim.keymap.set(
			{ "n", "x" },
			"<leader>si",
			'<cmd>lua require("fastaction").code_action()<CR>',
			{ desc = "Display code actions", buffer = bufnr }
		)
	end,
}
