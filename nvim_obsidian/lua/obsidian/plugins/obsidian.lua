return {
	"epwalsh/obsidian.nvim",
	version = "*",
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "default",
					path = "/Users/zhen/Library/Mobile Documents/iCloud~md~obsidian/Documents/zhen-vault",
				},
			},
			daily_notes = {
				folder = "daily",
			},
			note_id_func = function(title)
				return title or "untitled"
			end,
			disable_frontmatter = true,
		})
		local keymap = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }
		keymap("n", "<leader>sd", "<cmd>ObsidianFollowLink<CR>", opts)
		keymap("n", "<leader>nn", "<cmd>ObsidianNew<CR>", opts)
		keymap("n", "<leader>nt", "<cmd>ObsidianToday<CR>", opts)
		keymap("n", "<leader>nt", "<cmd>ObsidianYesterday<CR>", opts)
	end,
}
