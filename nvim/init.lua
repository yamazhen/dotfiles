vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.o.winborder = "single"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorcolumn = false
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

vim.pack.add({
    { src = "https://github.com/rose-pine/neovim",               name = "rose-pine" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/mfussenegger/nvim-jdtls",        load = false },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/echasnovski/mini.completion" },
    { src = "https://github.com/mfussenegger/nvim-lint" },
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/folke/trouble.nvim" }
})

require("rose-pine").setup({ styles = { transparency = true } })
require("oil").setup({ view_options = { show_hidden = true } })
require("fzf-lua").setup()
require("mini.completion").setup()
require("nvim-treesitter.configs").setup({ highlight = { enable = true }, auto_install = true })
require("trouble").setup({ auto_preview = false, keys = { ["<cr>"] = "jump_close", } })
require("config")
require("autocmd")

local map = vim.keymap.set
map("n", "<leader>o", ":update<CR> :source<CR>")
map("n", "<leader>ee", ":update<CR> :Oil<CR>")
map("n", "<C-e>", "<cmd>FzfLua files formatter='path.filename_first' previewer=false<CR>")
map("n", "<C-p>", "<cmd>FzfLua git_files formatter='path.filename_first' previewer=false<CR>")
map("n", "<leader>g", "<cmd>G<CR>")
map("n", "<leader>tt", "<cmd>Trouble diagnostics toggle win = {type = float} focus=true filter.buf=0<cr>")
map("n", "<leader>td", "<cmd>Trouble diagnostics toggle win = {type = float} focus=true<cr>")
map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')
map({ 'n', 'v', 'x' }, '<leader>p', '"+p<CR>')
