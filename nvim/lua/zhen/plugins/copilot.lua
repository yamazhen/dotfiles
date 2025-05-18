return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				auto_trigger = true,
			},
			panel = {
				enabled = false,
			},
			server_opts_overrides = {
				settings = {
					advanced = {
						inlineSuggestCount = 1,
						listCount = 0,
					},
				},
			},
		})
		local copilot_suggestion = require("copilot.suggestion")
		vim.g.copilot_enabled = true
		vim.keymap.set("i", "<C-l>", function()
			copilot_suggestion.accept()
		end)
		vim.keymap.set({ "n", "i" }, "<C-\\>", function()
			if vim.g.copilot_enabled then
				copilot_suggestion.dismiss()
				vim.cmd("Copilot disable")
				vim.g.copilot_enabled = false
				vim.notify("Copilot Disabled", vim.log.levels.INFO, { title = "Copilot" })
			else
				vim.cmd("Copilot enable")
				vim.g.copilot_enabled = true
				vim.notify("Copilot Enabled", vim.log.levels.INFO, { title = "Copilot" })
			end
		end, { desc = "Toggle Copilot" })
	end,
}
