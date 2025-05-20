return {
	"vague2k/vague.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("vague").setup()
		vim.cmd("colorscheme vague")
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })

		vim.cmd("highlight Pmenu guibg=NONE")
		vim.cmd("highlight WinSeparator guifg=#252530 guibg=NONE")
	end,
}
