return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = {
				registries = { "github:nvim-java/mason-registry", "github:mason-org/mason-registry" },
			},
		},
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_enable = {
				exclude = { "ts_ls" },
			},
		})

		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				header = "",
				prefix = "",
			},
		})

		local keymap = vim.keymap.set
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client then
					client.server_capabilities.semanticTokensProvider = nil
				end
				local opts = { buffer = event.buf, noremap = true, silent = true }
				keymap("n", "<leader>sd", vim.lsp.buf.definition, opts)
				keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
				keymap("n", "<leader>md", vim.diagnostic.open_float, opts)
			end,
		})
	end,
}
