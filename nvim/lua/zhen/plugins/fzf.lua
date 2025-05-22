return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Find Buffers",
		},
		{
			"<leader>fs",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Live Grep",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").git_files()
			end,
		},
		{
			"<leader>sr",
			function()
				require("fzf-lua").lsp_references()
			end,
			desc = "LSP References",
		},
	},
	config = function()
		require("fzf-lua").setup({
			winopts = {
				height = 0.6,
				width = 0.6,
				row = 0.6,
				col = 0.6,
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
	end,
}
