return {
	"epwalsh/obsidian.nvim",
	version = "*",
	opts = {
		workspaces = {
			{
				name = "personal",
				path = vim.fn.expand("~/Library/Mobile Documents/iCloud~md~obsidian/Documents/journal"),
			},
		},
	},
	keys = {
		{ "<leader>ot", "<cmd>ObsidianToday<CR>" },
		{ "<leader>on", "<cmd>ObsidianNew<CR>" },
		{ "<leader>oy", "<cmd>ObsidianToday -1<CR>" },
		{ "<leader>of", "<cmd>ObsidianQuickSwitch<CR>" },
	},
}
