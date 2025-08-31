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
	{ src = "https://github.com/rose-pine/neovim",               name = "rose-pine" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/github/copilot.vim" },
})

require("mason").setup({ registries = { "github:nvim-java/mason-registry", "github:mason-org/mason-registry" } })
require("blink.cmp").setup({ completion = { documentation = { auto_show = true } } })
require("rose-pine").setup({ styles = { transparency = true, italic = false } })
require("fzf-lua").setup({ "ivy", winopts = { border = "none", preview = { hidden = true } }, files = { no_ignore = true } })
require("oil").setup({ view_options = { show_hidden = true } })
require("mason-lspconfig").setup()

vim.cmd("colorscheme rose-pine-moon")
vim.opt.diffopt:append("vertical")

vim.api.nvim_set_keymap("i", "<C-l>", "copilot#Accept('<CR>')", { expr = true, silent = true, noremap = true })
vim.keymap.set("n", "<leader>g", "<cmd>G<CR>")
vim.keymap.set("n", "<leader>ee", "<cmd>Oil<CR>")
vim.keymap.set("n", "<C-e>", "<cmd>FzfLua files formatter='path.filename_first'<CR>")
vim.keymap.set("n", "<leader>ps", "<cmd>FzfLua grep_project formatter='path.filename_first'<CR>")
vim.keymap.set("n", "<leader>si", require("fzf-lua").lsp_code_actions)
vim.keymap.set("n", "<leader>sd", vim.lsp.buf.definition)
vim.keymap.set("n", "=", vim.lsp.buf.format)
