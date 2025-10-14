vim.g.mapleader = " "
vim.o.mouse = ""
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
vim.opt.scrolloff = 10
vim.opt.fillchars:append({ eob = " " })

vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/folke/trouble.nvim" },
})

require("rose-pine").setup({ styles = { transparency = true, italic = false } })
require("oil").setup({ view_options = { show_hidden = true } })
require("fzf-lua").setup({ "ivy", winopts = { border = "none", preview = { hidden = true } } })
require("mason").setup({
	registries = {
		"github:nvim-java/mason-registry",
		"github:mason-org/mason-registry",
	},
})
require("blink.cmp").setup({ snippets = { preset = "luasnip" } })
require("luasnip.loaders.from_lua").load({ paths = { "./snippets" } })
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").config.set_config({
	region_check_events = "InsertEnter",
	delete_check_events = "InsertLeave",
})
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	auto_install = true,
	indent = { enable = true },
	modules = {},
	ensure_installed = "",
	sync_install = false,
	ignore_install = {},
})
require("mason-lspconfig").setup({})
require("trouble").setup({
	auto_preview = false,
	focus = true,
	keys = {
		["<cr>"] = "jump_close",
	},
})
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		typescript = { "prettierd" },
		html = { "prettierd" },
		css = { "prettierd" },
		python = { "ruff" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
})

vim.cmd("colorscheme rose-pine-moon")
vim.opt.diffopt:append("vertical")

vim.keymap.set("n", "<leader>g", "<cmd>G<CR>")
vim.keymap.set("n", "<leader>ee", "<cmd>Oil<CR>")
vim.keymap.set("n", "<C-e>", "<cmd>FzfLua files formatter='path.filename_first'<CR>")
vim.keymap.set("n", "<leader>ps", "<cmd>FzfLua grep_project formatter='path.filename_first'<CR>")
vim.keymap.set("n", "<leader>si", "<cmd>FzfLua lsp_code_actions silent=true<CR>")
vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>")
vim.keymap.set("n", "<leader>sd", vim.lsp.buf.definition)
vim.keymap.set("n", "=", function()
	require("conform").format()
end)
