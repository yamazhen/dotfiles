vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.clipboard = "unnamedplus"

vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim",               name = "rose-pine" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/mfussenegger/nvim-jdtls",        load = false },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/echasnovski/mini.completion" },
	{ src = "https://github.com/tpope/vim-fugitive" },
})

require("rose-pine").setup({ styles = { transparency = true } })
require("oil").setup({ view_options = { show_hidden = true } })
require("fzf-lua").setup()
require("mini.completion").setup()
require("nvim-treesitter.configs").setup({ highlight = { enable = true }, auto_install = true })

vim.lsp.enable({ "lua_ls", "ts_ls", "emmet_ls" })
vim.opt.completeopt = "menu,menuone,noinsert"
vim.cmd("colorscheme rose-pine-moon")
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#252530" })

local map = vim.keymap.set
map("n", "<leader>ee", ":40vsplit | Oil<CR>")
map("n", "<C-e>", "<cmd>FzfLua files formatter='path.filename_first' previewer=false<CR>")
map("n", "<C-p>", "<cmd>FzfLua git_files formatter='path.filename_first' previewer=false<CR>")
map("n", "<leader>g", "<cmd>G<CR>")
map("n", "<C-g>", "<cmd>G pull --rebase<CR>")
map("n", "<leader>tt", vim.diagnostic.setloclist)
map("n", "<leader>td", vim.diagnostic.setqflist)

local autocmd = vim.api.nvim_create_autocmd
autocmd('FileType', {
	pattern = 'qf',
	callback = function() map('n', '<CR>', '<CR>:lclose<CR>:cclose<CR>', { buffer = true }) end
})
autocmd("BufWritePre", {
	callback = function()
		if #vim.lsp.get_clients({ bufnr = 0, method = "textDocument/formatting" }) > 0 then
			vim.lsp.buf.format()
		end
	end
})
