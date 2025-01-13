return {
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("ayu-dark")

			-- transparency fix
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.cmd("highlight Pmenu guibg=NONE")

			-- Set inactive line numbers to white
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#FFFFFF" })

			-- same color as tmux
			vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#ffffff" })
			vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#ffffff" })
		end,
	},
}
