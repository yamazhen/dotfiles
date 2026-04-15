vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.o.colorcolumn = "80"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/NMAC427/guess-indent.nvim" },
})

require("rose-pine").setup({ styles = { transparency = true, italic = false } })
require("oil").setup({ view_options = { show_hidden = true } })
require("fzf-lua").setup({ "ivy", winopts = { border = "none", preview = { hidden = true } } })
require("mason").setup()
require("mason-lspconfig").setup({ automatic_enable = { exclude = { "jdtls", "ts_ls" } } })
require("blink.cmp").setup()
require("guess-indent").setup()
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		typescript = { "prettierd" },
		html = { "prettierd" },
		css = { "prettierd" },
		json = { "jq" },
		python = { "ruff_organize_imports", "ruff_format" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
})

vim.cmd("colorscheme rose-pine-moon")
vim.opt.diffopt:append("vertical")
vim.filetype.add({ pattern = { [".*/templates/.*%.ya?ml"] = "helm" } }) -- for helm
local highlight = function(e) -- manually install parsers (TSInstall)
	pcall(vim.treesitter.start, e.buf, vim.treesitter.language.get_lang(e.match) or e.match)
end -- this loads the parsers for the language
vim.api.nvim_create_autocmd("FileType", { pattern = { "*" }, callback = highlight })

vim.keymap.set("n", "<leader>ee", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>g", "<cmd>Git<CR>")
vim.keymap.set("n", "<C-e>", "<cmd>FzfLua files formatter='path.filename_first'<CR>")
vim.keymap.set("n", "<leader>ps", "<cmd>FzfLua grep_project formatter='path.filename_first'<CR>")
vim.keymap.set("n", "<leader>si", "<cmd>FzfLua lsp_code_actions silent=true<CR>")
vim.keymap.set("n", "<leader>sd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>tt", "<cmd>lua vim.diagnostic.setloclist({open=true, bufnr=0})<CR>")
vim.keymap.set("n", "=", function()
	vim.snippet.stop()
	require("conform").format()
	vim.cmd("GuessIndent")
end)
