return {
	{
		"mfussenegger/nvim-jdtls",
		ft = { "java" },
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")

			dap.configurations.java = {
				{
					type = "java",
					request = "attach",
					name = "[ATTACH] Remote Debug",
					hostName = "127.0.0.1",
					port = 5005,
				},
				{
					type = "java",
					request = "launch",
					name = "[DEBUG] Spring Boot App",
					mainClass = "",
					projectName = "",
					args = "",
					vmArgs = "-Dspring.profiles.active=dev",
				},
			}

			dap.adapters.java = function(callback)
				callback({
					type = "server",
					host = "127.0.0.1",
					port = 5005,
				})
			end

			require("dapui").setup()

			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end)
			vim.keymap.set("n", "<F10>", function()
				dap.step_over()
			end)
			vim.keymap.set("n", "<F11>", function()
				dap.step_into()
			end)
			vim.keymap.set("n", "<F12>", function()
				dap.step_out()
			end)
			vim.keymap.set("n", "<Leader>b", function()
				dap.toggle_breakpoint()
			end)
		end,
	},
}
