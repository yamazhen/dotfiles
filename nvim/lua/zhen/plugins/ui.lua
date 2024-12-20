return {
	{
		"tiagovla/tokyodark.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			require("tokyodark").setup({})

			vim.cmd.colorscheme("tokyodark")

			-- transparency fix
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.cmd("highlight Pmenu guibg=NONE")

			-- same color as tmux
			vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#ffffff" })
			vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#ffffff" })
		end,
	},
}
