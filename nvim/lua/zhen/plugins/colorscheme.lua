return {
	{
		"vague2k/vague.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			require("vague").setup({
				transparent = true,
			})
			vim.cmd.colorscheme("vague")

			-- same color as tmux
			vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#ffffff" })
			vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#ffffff" })
		end,
	},
}
