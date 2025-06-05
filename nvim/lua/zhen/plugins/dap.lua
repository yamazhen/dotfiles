return {
	"mfussenegger/nvim-dap",
	dependencies = { "igorlfs/nvim-dap-view", opts = {} },
	keys = {
		{ "<leader>dv", desc = "Debug: Toggle DAP View" },
		{ "<leader>dc", desc = "Debug: Continue" },
		{ "<leader>do", desc = "Debug: Step Over" },
		{ "<leader>di", desc = "Debug: Step Into" },
		{ "<leader>dx", desc = "Debug: Step Out" },
		{ "<leader>b", desc = "Debug: Toggle Breakpoint" },
		{ "<leader>B", desc = "Debug: Set Conditional Breakpoint" },
	},
	config = function()
		local dap, dv = require("dap"), require("dap-view")
		dap.set_log_level("DEBUG")

		dv.setup({
			winbar = {
				sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "console" },
				default_section = "scopes",
			},
			windows = {
				height = 12,
			},
		})

		-- WIP: add debugger for typescript

		dap.listeners.before.attach["dap-view-config"] = function()
			dv.open()
		end
		dap.listeners.before.launch["dap-view-config"] = function()
			dv.open()
		end

		local keymap = vim.keymap.set
		keymap("n", "dv", "<cmd>DapViewToggle<cr>", { desc = "Debug: Toggle DAP View" })
		keymap("n", "<leader>dc", dap.continue)
		keymap("n", "<leader>do", dap.step_over)
		keymap("n", "<leader>di", dap.step_into)
		keymap("n", "<leader>dx", dap.step_out)
		keymap("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		keymap("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Conditional Breakpoint" })
	end,
}
