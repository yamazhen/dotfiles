return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	config = function()
		vim.api.nvim_set_hl(0, "IblScope", { fg = "#ffffff" })

		require("ibl").setup({
			indent = { char = "│" },
			scope = {
				show_start = false,
				show_end = false,
			},
			exclude = {
				filetypes = { "yaml", "yml" },
			},
		})
	end,
}
