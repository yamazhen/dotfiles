vim.g.mapleader = " "
vim.o.mouse = ""
vim.o.clipboard = "unnamedplus"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10

vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("blink.cmp").setup({ completion = { documentation = { auto_show = true } } })
require("rose-pine").setup({ styles = { transparency = true, italic = false } })
require("fzf-lua").setup({ "ivy", winopts = { border = "none", preview = { hidden = true } } })
require("oil").setup({ view_options = { show_hidden = true } })
require("mason").setup({ registries = { "github:nvim-java/mason-registry", "github:mason-org/mason-registry" } })
require("mason-lspconfig").setup()
require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		lua = { "stylua" },
		html = { "prettier" },
		json = { "prettier" },
	},
})
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	sync_install = false,
	auto_install = true,
	ensure_installed = "",
	ignore_install = {},
	modules = {},
})

vim.cmd("colorscheme rose-pine-moon")
vim.opt.diffopt:append("vertical")

vim.keymap.set("n", "<leader>g", "<cmd>G<CR>")
vim.keymap.set("n", "<leader>ee", "<cmd>Oil<CR>")
vim.keymap.set("n", "<C-e>", "<cmd>FzfLua files formatter='path.filename_first'<CR>")
vim.keymap.set("n", "<leader>ps", "<cmd>FzfLua grep_project formatter='path.filename_first'<CR>")
vim.keymap.set("n", "<leader>si", require("fzf-lua").lsp_code_actions)
vim.keymap.set("n", "<leader>sd", vim.lsp.buf.definition)
vim.keymap.set("n", "=", function()
	require("conform").format()
end)
