return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason").setup({
				registries = {
					"github:nvim-java/mason-registry",
					"github:mason-org/mason-registry",
				},
			})
			local lspconfig_defaults = require("lspconfig").util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				"force",
				lspconfig_defaults.capabilities,
				require("blink.cmp").get_lsp_capabilities()
			)

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						if server_name == "jdtls" or server_name == "ts_ls" or server_name == "cssls" then
							return
						end
						require("lspconfig")[server_name].setup({})
					end,
				},
			})

			local custom_configs = { "tailwindcss", "cssls", "emmet_language_server", "dartls" }
			for _, config in ipairs(custom_configs) do
				local _ = pcall(require, "zhen.plugins.customlsp." .. config)
			end

			local keymap = vim.keymap.set

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf, noremap = true, silent = true }
					keymap("n", "<leader>sd", vim.lsp.buf.definition, opts)
					keymap("n", "<leader>si", vim.lsp.buf.code_action, opts)
					keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
					keymap("n", "<leader>md", vim.diagnostic.open_float, opts)
				end,
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			notification = {
				window = {
					align = "top",
				},
			},
		},
	},
}
