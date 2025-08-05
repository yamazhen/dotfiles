return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = {
		{
			"<C-e>",
			"<cmd>FzfLua buffers formatter='path.filename_first'<CR>",
		},
		{
			"<leader>pf",
			"<cmd>FzfLua files formatter='path.filename_first'<CR>",
		},
		{
			"<C-p>",
			"<cmd>FzfLua git_files formatter='path.filename_first'<CR>",
		},
		{
			"<leader>pws",
			function()
				local word = vim.fn.expand("<cword>")
				require("fzf-lua").grep({ search = word, formatter = "path.filename_first" })
			end,
			desc = "Live Grep",
		},
		{
			"<leader>pWs",
			function()
				local word = vim.fn.expand("<cWORD>")
				require("fzf-lua").grep({ search = word, formatter = "path.filename_first" })
			end,
		},
		{
			"<leader>ps",
			function()
				require("fzf-lua").grep({ search = vim.fn.input("Grep > "), formatter = "path.filename_first" })
			end,
			desc = "LSP References",
		},
		{
			"<leader>rf",
			"<cmd>FzfLua lsp_references formatter='path.filename_first'<CR>",
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
			fzf_colors = false,
		})
	end,
}
