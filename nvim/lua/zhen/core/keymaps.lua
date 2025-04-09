vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>z", "za", opts)
keymap("n", "<leader><Left>", "<C-o>", opts)
keymap("n", "<leader><Right>", "<C-i>", opts)
keymap("n", "<leader>mp", "ggVG=", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>l", "<C-w>l", opts)
keymap("n", "<leader>ml", "<cmd>LspInstall<CR>", opts)
keymap("n", "<leader>sh", "<cmd>split<CR>", opts)
keymap("n", "<leader>sv", "<cmd>vsplit<CR>", opts)
keymap("n", "<leader>x", "<cmd>close<CR>", opts)
keymap("n", "<leader>bd", "<cmd>bd<CR>", opts)
