return {
	"ibhagwan/fzf-lua",
	config = function()
		local fzf = require("fzf-lua")
		local keymap = vim.keymap.set

		fzf.setup({
			winopts = {
				height = 0.6,
				width = 0.6,
				row = 0.6,
				col = 0.6,
				border = "single",
				preview = { hidden = "hidden" },
			},
			file_icon_padding = "",
			file_icons = false,
			fzf_opts = {
				["--layout"] = "reverse",
				["--info"] = "inline",
			},
			files = {
				formatter = "path.filename_first",
			},
			buffers = {
				formatter = "path.filename_first",
			},
		})

		-- keymaps
		local opts = { noremap = true, silent = true }
		keymap({ "n", "t" }, "<leader>ff", fzf.files, opts)
		keymap({ "n", "t" }, "<leader>fs", fzf.live_grep, opts)
		keymap({ "n", "t" }, "<leader>sr", fzf.lsp_references, opts)
	end,
}
