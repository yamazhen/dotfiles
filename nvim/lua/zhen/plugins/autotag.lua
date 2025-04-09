return {
	"windwp/nvim-ts-autotag",
	ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "xml" },
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = false,
				enable_close_on_slash = true,
			},
		})
	end,
}
