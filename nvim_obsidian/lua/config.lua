require("rose-pine").setup({ styles = { transparency = true, italic = false } })
require("blink.cmp").setup()
require("oil").setup({ view_options = { show_hidden = true } })

require("render-markdown").setup({
	completions = { blink = { enabled = true } },
	code = { border = "thin", width = "block" },
})

require("nvim-treesitter.configs").setup({
	highlight = { enable = true, additional_vim_regex_highlighting = false },
	auto_install = true,
	sync_install = false,
	ensure_installed = "",
	ignore_install = {},
	modules = {},
	indent = { enable = true },
})

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
	note_id_func = function(title)
		return title or "untitled"
	end,
	legacy_commands = false,
})

require("snacks").setup({
	image = { enabled = true },
	picker = {
		formatters = {
			file = {
				filename_first = true,
			},
		},
		layout = {
			preset = "ivy",
			preview = false,
		},
	},
	dashboard = {
		enabled = true,
		preset = {
			keys = function()
				local recent = vim.v.oldfiles and vim.v.oldfiles[1] or "None"
				local display_name = recent ~= "None" and vim.fn.fnamemodify(recent, ":t:r") or "None"
				return {
					{
						icon = "",
						key = "l",
						desc = "Recent: " .. display_name,
						action = function()
							if recent ~= "None" then
								vim.cmd("edit " .. recent)
							end
						end,
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
	⠀⠀⠀⠀⣾⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠇]],
		},
		sections = {
			{ section = "header" },
			{ section = "keys" },
		},
	},
})

vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "white" })
vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "white" })
vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "white" })
vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "white" })
vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = "white" })
