return {
	"Shatur/neovim-ayu",
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("ayu-dark")

		-- transparency fix
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.cmd("highlight Pmenu guibg=NONE")
		vim.cmd("highlight WinSeparator guifg=#1e232b guibg=NONE")

		-- Set inactive line numbers lighter
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff" })

		-- same color as tmux
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#bfbdb6" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#bfbdb6" })
	end,
}
