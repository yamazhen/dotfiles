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
						if server_name == "jdtls" or server_name == "ts_ls" or "cssls" then
							return
						end
						require("lspconfig")[server_name].setup({})
					end,
				},
			})

			local custom_configs = { "tailwindcss", "cssls" }
			for _, config in ipairs(custom_configs) do
				local ok, _ = pcall(require, "zhen.plugins.customlsp." .. config)
			end
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
