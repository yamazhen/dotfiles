vim.g.mapleader = " "
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
vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = false

vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim",               name = "rose-pine" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/mfussenegger/nvim-jdtls",        load = false },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/github/copilot.vim" },
})

require("rose-pine").setup({ styles = { transparency = true } })
require("oil").setup({ view_options = { show_hidden = true } })
require("fzf-lua").setup({ "ivy", winopts = { border = "none", preview = { hidden = true } } })
require("blink.cmp").setup({ snippets = { preset = "luasnip" } })
require("nvim-treesitter.configs").setup({ highlight = { enable = true }, auto_install = true })
require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets/" } })
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").config.set_config({ region_check_events = "InsertEnter", delete_check_events = "InsertLeave" })

vim.lsp.enable({ "lua_ls", "ts_ls", "emmet_ls", "html", "cssls" })
vim.opt.completeopt = "menu,menuone,noinsert"
vim.cmd("colorscheme rose-pine-moon")
vim.g.copilot_no_tab_map = true

vim.keymap.set("i", "<C-l>", "copilot#Accept()", { expr = true, replace_keycodes = false })
vim.keymap.set("n", "<leader>ee", ":Oil<CR>")
vim.keymap.set("n", "<C-e>", ":FzfLua files formatter='path.filename_first'<CR>")
vim.keymap.set("n", "<leader>ps", ":lua require('fzf-lua').grep({ search = vim.fn.input('Grep > ')})<cr>")
vim.keymap.set("n", "<leader>g", ":G<CR>")
vim.keymap.set("n", "<leader>si", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>tt", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>td", vim.diagnostic.setqflist)

vim.api.nvim_create_autocmd('FileType',
	{ pattern = 'qf', callback = function() vim.keymap.set('n', '<CR>', '<CR>:lclose<CR>:cclose<CR>', { buffer = true }) end })
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		if vim.bo.filetype == "html" and vim.fn.expand("%:e") == "ejs" then return end
		if #vim.lsp.get_clients({ bufnr = 0, method = "textDocument/formatting" }) > 0 then
			vim.lsp.buf.format()
		end
	end
})
