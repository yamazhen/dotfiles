return {
	"williamboman/mason-lspconfig.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = { registries = { "github:nvim-java/mason-registry", "github:mason-org/mason-registry" } },
		},
		"neovim/nvim-lspconfig",
	},
	init = function()
		local lspConfigPath = require("lazy.core.config").options.root .. "/nvim-lspconfig"
		vim.opt.runtimepath:append(lspConfigPath)

		local blink_capabilities = require("blink.cmp").get_lsp_capabilities()

		local skip_servers = {
			"jdtls",
			"ts_ls",
			"cssls",
			"emmet_language_server",
			"tailwindcss",
		}

		require("mason").setup({})
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					if vim.tbl_contains(skip_servers, server_name) then
						return
					end
					vim.lsp.config(server_name, {
						capabilities = blink_capabilities,
					})
					vim.lsp.enable(server_name)
				end,
			},
		})
		require("zhen.plugins.customlsp")

		local keymap = vim.keymap.set
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf, noremap = true, silent = true }
				keymap("n", "<leader>sd", vim.lsp.buf.definition, opts)
				keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
				keymap("n", "<leader>md", vim.diagnostic.open_float, opts)
			end,
		})
	end,
}
