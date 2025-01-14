return {
	"ibhagwan/fzf-lua",
	config = function()
		local fzf = require("fzf-lua")
		local keymap = vim.keymap

		fzf.setup({
			winopts = {
				preview = {
					vertical = "down:40%",
					horizontal = "right:50%",
				},
			},
			files = {
				formatter = "path.filename_first",
			},
			buffers = {
				formatter = "path.filename_first",
			},
		})
	end,
}
