require("obsidian").setup({
	workspaces = {
		{
			name = "default",
			path = "/Users/zhen/Library/Mobile Documents/iCloud~md~obsidian/Documents/zhen-vault",
		},
	},
	completion = { blink = true },
	daily_notes = { folder = "daily" },
	disable_frontmatter = true,
	note_id_func = function(title) return title or "untitled" end,
	legacy_commands = false
})

local snacks = require("snacks")
snacks.setup({
	dashboard = {
		enabled = true,
		preset = {
			keys = function()
				local recent = vim.v.oldfiles and vim.v.oldfiles[1] and vim.fn.fnamemodify(vim.v.oldfiles[1], ":t:r") or
				"None"
				return {
					{
						icon = "",
						key = "l",
						desc = "Recent: " .. recent,
						action = function()
							if recent ~= "None" then vim.cmd("edit " .. recent .. ".md") end
						end
					},
					{ icon = "", key = "f", desc = "Find Note", action = ":Obsidian quick_switch" },
					{ icon = "", key = "n", desc = "New Note", action = ":Obsidian new" },
					{ icon = "󱉥", key = "t", desc = "Today's Note", action = ":Obsidian today" },
					{ icon = "󰩈", key = "q", desc = "Quit", action = ":q" },
				}
			end,
			header = [[
                  ⣤⣶⣶⠿⠿⠿⣶⣦⣀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠛⠉⠀⠀⠀⠀⠀⠀⠉⠻⣧⡀⠀
	⢠⣄⣀⣀⣀⣀⣀⣀⣀⣴⠋⠀⠀⠀⠀⠀⣴⣆⠀⠀⠀⠀⠘⣿⡀
	⠀⠙⠻⣿⣟⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀⠘⠿⠋⠀⠀⠀⠀⠀⣿⡇
	⠀⠀⠀⠀⠙⢷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡇
	⠀⠀⠀⠀⠀⠀⠘⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣽⠃
	⠀⠀⠀⠀⠀⠀⢰⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀
	⠀⠀⠀⠀⠀⠀⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡿⠀
	⠀⠀⠀⠀⠀⢸⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠃⠀
	⠀⠀⠀⠀⢀⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀⠀
	⠀⠀⠀⠀⣾⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠇⠀⠀
		]],
		},
		sections = {
			{ section = "header" },
			{ section = "keys" },
		}
	},
	image = { enabled = true }
})
vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "white" })
vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "white" })
vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "white" })
vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "white" })
vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = "white" })
vim.keymap.set("n", "<leader>ee", ":Oil<CR>")
vim.keymap.set("n", "<C-e>", ":Obsidian quick_switch<CR>")
vim.keymap.set("n", "<leader>on", ":Obsidian new<CR>")
vim.keymap.set("n", "<leader>ot", ":Obsidian today<CR>")
