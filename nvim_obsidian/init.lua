vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = false
vim.opt.cmdheight = 0
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim-treesitter#foldexpr()"
vim.opt.foldlevel = 0

vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim",                         name = "rose-pine" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/obsidian-nvim/obsidian.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" }
})

require("nvim-treesitter.configs").setup({ highlight = { enable = true }, auto_install = true })
require("rose-pine").setup({ styles = { transparency = true } })
require("blink.cmp").setup()
require("oil").setup({ view_options = { show_hidden = true } })
require("render-markdown").setup()
require("config")

vim.cmd("colorscheme rose-pine-moon")
