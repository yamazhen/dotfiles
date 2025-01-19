vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>z", "za", { noremap = true, silent = true })
keymap("x", "<leader>p", [["_dP]], opts)
keymap("n", "<leader><Left>", "<C-o>", opts)
keymap("n", "<leader><Right>", "<C-i>", opts)
keymap("n", "<leader>mp", "ggVG=", opts)
keymap("n", "<leader>ee", "<CMD>Ex<CR>", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>ml", "<cmd>LspInstall<CR>", { desc = "Install LSP for this filetype" })
