vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("x", "<leader>p", "'_dP")
keymap.set({ "n", "t" }, "<leader><Left>", "<CMD>bprevious<CR>")
keymap.set({ "n", "t" }, "<leader><Right>", "<CMD>bnext<CR>")
keymap.set("n", "<leader>mp", "ggVG=")
keymap.set("n", "<leader>ee", "<CMD>Ex<CR>")
keymap.set("n", "<leader><Up>", "<C-w>k", { noremap = true, silent = true })
keymap.set("n", "<leader><Down>", "<C-w>j", { noremap = true, silent = true })
