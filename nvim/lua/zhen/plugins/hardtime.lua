return {
	"m4xshen/hardtime.nvim",
	opts = {
		disabled_filetypes = { "lazy", "mason", "oil", "grapple", "trouble" },
		max_time = 1000,
		max_count = 3,
		disable_mouse = true,
		hint = true,
		notification = true,
		callback = function(text)
			require("fidget").notify(text, vim.log.levels.WARN, {
				timeout = 2000,
			})
		end,
	},
}
