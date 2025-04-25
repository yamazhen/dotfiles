return {
	"m4xshen/hardtime.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		disabled_filetypes = { "lazy", "mason", "oil", "grapple" },
		max_time = 1000,
		max_count = 2,
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
