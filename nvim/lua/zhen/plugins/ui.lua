return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			require("nightfox").setup({
				options = {
					transparent = true,
				},
			})

			vim.cmd.colorscheme("carbonfox")

			-- transparency fix
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.cmd("highlight Pmenu guibg=NONE")

			-- same color as tmux
			vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#ffffff" })
			vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#ffffff" })
		end,
	},
}
