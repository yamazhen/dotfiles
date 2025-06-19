return {
	"ibhagwan/fzf-lua",
	config = function()
		require("fzf-lua").setup({
			winopts = {
				height = 0.6,
				width = 0.6,
				row = 0.6,
				col = 0.6,
				preview = { hidden = "hidden" },
			},
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
			fzf_colors = false,
		})
	end,
}
