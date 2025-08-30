vim.g.mapleader = " "
vim.o.guicursor = ""
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = false
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
vim.opt.cmdheight = 0
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim-treesitter#foldexpr()"
vim.opt.foldlevel = 0

vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/obsidian-nvim/obsidian.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
})

require("config")

vim.cmd("colorscheme rose-pine-moon")
vim.keymap.set("n", "<leader>ee", ":Oil<CR>")
vim.keymap.set("n", "<C-e>", ":Obsidian quick_switch<CR>")
vim.keymap.set("n", "<leader>on", ":Obsidian new<CR>")
vim.keymap.set("n", "<leader>ot", ":Obsidian today<CR>")
vim.keymap.set("n", "<C-]>", ":Obsidian follow_link<CR>")
vim.keymap.set("n", "=", "m`gg=G``")
