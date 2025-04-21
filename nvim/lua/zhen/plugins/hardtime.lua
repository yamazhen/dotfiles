return {
	"m4xshen/hardtime.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		disabled_filetypes = { "lazy", "mason", "oil" },
		max_time = 1000,
		max_count = 2,
		disable_mouse = true,
		hint = true,
		notification = true,
		callback = function(text)
			require("fidget").notify(text, vim.log.levels.WARN, {
				timeout = 5000,
			})
		end,
	},
}
