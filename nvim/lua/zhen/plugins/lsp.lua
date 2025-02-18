return {
	{ "williamboman/mason-lspconfig.nvim" },
	{ "j-hui/fidget.nvim", opts = {} },
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("mason").setup({})
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
					local fzf = require("fzf-lua")
					keymap("n", "<leader>sd", vim.lsp.buf.definition, opts)
					keymap("n", "<leader>sr", fzf.lsp_references, opts)
					keymap("n", "<leader>si", vim.lsp.buf.code_action, opts)
					keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
					keymap("n", "<leader>md", vim.diagnostic.open_float, opts)
					keymap("n", "<leader>mD", fzf.diagnostics_document, { noremap = true, silent = true })
				end,
			})
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		ft = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
		opts = {},
	},
	{
		"williamboman/mason.nvim",
		opts = { registries = { "github:nvim-java/mason-registry", "github:mason-org/mason-registry" } },
	},
}
