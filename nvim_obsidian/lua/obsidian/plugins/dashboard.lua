return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local function get_recent_note()
			vim.cmd("rshada!")

			local oldfiles = vim.v.oldfiles

			if #oldfiles == 0 then
				local handle =
					io.popen('find . -name "*.md" -type f -printf "%T@ %p\\n" | sort -nr | head -1 | cut -d" " -f2-')
				if handle then
					local recent_file = handle:read("*a"):gsub("%s+", "")
					handle:close()
					if recent_file and recent_file ~= "" and vim.fn.filereadable(recent_file) == 1 then
						local name = vim.fn.fnamemodify(recent_file, ":t:r")
						return name, recent_file
					end
				end
			end

			for _, file in ipairs(oldfiles) do
				if file:match("%.md$") and vim.fn.filereadable(file) == 1 then
					local name = vim.fn.fnamemodify(file, ":t:r")
					return name, file
				end
			end

			return "No Recent Notes", nil
		end

		local function open_recent_note()
			local _, file_path = get_recent_note()
			if file_path then
				vim.cmd("edit " .. vim.fn.fnameescape(file_path))
			else
				vim.notify("No recent notes found", vim.log.levels.WARN)
			end
		end

		-- Punpun ASCII art
		dashboard.section.header.val = {
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣶⠿⠿⠿⣶⣦⣀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠛⠉⠀⠀⠀⠀⠀⠀⠉⠻⣧⡀⠀",
			"⢠⣄⣀⣀⣀⣀⣀⣀⣀⣴⠋⠀⠀⠀⠀⠀⣴⣆⠀⠀⠀⠀⠘⣿⡀",
			"⠀⠙⠻⣿⣟⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀⠘⠿⠋⠀⠀⠀⠀⠀⣿⡇",
			"⠀⠀⠀⠀⠙⢷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡇",
			"⠀⠀⠀⠀⠀⠀⠘⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣽⠃",
			"⠀⠀⠀⠀⠀⠀⢰⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀",
			"⠀⠀⠀⠀⠀⠀⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡿⠀",
			"⠀⠀⠀⠀⠀⢸⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠃⠀",
			"⠀⠀⠀⠀⢀⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀⠀",
			"⠀⠀⠀⠀⣾⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠇⠀⠀",
			"",
		}

		local recent_note_name, _ = get_recent_note()
		local recent_button_text = recent_note_name and ("Open Recent (" .. recent_note_name .. ")")
			or "No Recent Notes"
		_G.open_recent_note = open_recent_note

		dashboard.section.buttons.val = {
			dashboard.button("f", "Find Notes", "<cmd>ObsidianQuickSwitch<CR>"),
			dashboard.button(
				"r",
				recent_button_text,
				":lua require('alpha').setup(require('alpha.themes.dashboard').config); open_recent_note()<CR>"
			),
			dashboard.button("n", "New Note", "<cmd>ObsidianNew<CR>"),
			dashboard.button("t", "Today's Note", "<cmd>ObsidianToday<CR>"),
			dashboard.button("q", "Quit", ":qa<CR>"),
		}

		dashboard.section.footer.val = {}

		dashboard.section.header.opts.hl = "Normal"
		dashboard.section.buttons.opts.hl = "Normal"

		dashboard.config.layout = {
			{ type = "padding", val = 2 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
		}

		dashboard.config.opts.noautocmd = true
		alpha.setup(dashboard.config)
	end,
}
