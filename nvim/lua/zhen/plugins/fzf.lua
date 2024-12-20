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

		-- keymaps
		keymap.set({ "n", "t" }, "<leader>ff", fzf.files, { noremap = true, silent = true })
		keymap.set({ "n", "t" }, "<leader>fs", fzf.live_grep, { noremap = true, silent = true })
		keymap.set({ "n", "t" }, "<leader>fg", fzf.git_files, { noremap = true, silent = true })
		keymap.set({ "n", "t" }, "<leader>fb", fzf.buffers, { noremap = true, silent = true })
	end,
}
