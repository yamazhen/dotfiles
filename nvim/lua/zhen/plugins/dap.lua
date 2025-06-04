return {
	"mfussenegger/nvim-dap",
	dependencies = { "igorlfs/nvim-dap-view", opts = {} },
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

		vim.keymap.set("n", "<leader>dv", "<cmd>DapViewToggle<cr>", { desc = "Debug: Toggle DAP View" })
		vim.keymap.set("n", "<leader>dc", dap.continue)
		vim.keymap.set("n", "<leader>do", dap.step_over)
		vim.keymap.set("n", "<leader>di", dap.step_into)
		vim.keymap.set("n", "<leader>dx", dap.step_out)
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Set Conditional Breakpoint" })
	end,
}
