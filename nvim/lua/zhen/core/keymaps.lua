vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("x", "<leader>p", [["_dP]], opts)
keymap("n", "<leader><Left>", "<C-o>", opts)
keymap("n", "<leader><Right>", "<C-i>", opts)
keymap("n", "<leader>mp", "ggVG=", opts)
keymap("n", "<leader>ee", "<CMD>Ex<CR>", opts)
keymap("n", "<leader><Up>", "<C-w>k", opts)
keymap("n", "<leader><Down>", "<C-w>j", opts)
