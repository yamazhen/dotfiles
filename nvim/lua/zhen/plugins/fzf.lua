return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = {
		{
			"<leader>pf",
			function()
				require("fzf-lua").files()
			end,
		},
		{
			"<C-p>",
			function()
				require("fzf-lua").git_files()
			end,
		},
		{
			"<leader>pws",
			function()
				local word = vim.fn.expand("<cword>")
				require("fzf-lua").grep({ search = word })
			end,
			desc = "Live Grep",
		},
		{
			"<leader>pWs",
			function()
				local word = vim.fn.expand("<cWORD>")
				require("fzf-lua").grep({ search = word })
			end,
		},
		{
			"<leader>ps",
			function()
				require("fzf-lua").grep({ search = vim.fn.input("Grep > ") })
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
			fzf_colors = true,
		})
	end,
}
