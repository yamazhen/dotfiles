vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader><Left>", "<cmd>bprevious<CR>", {desc = "Previous Buffer"})
keymap.set("n", "<leader><Right>", "<cmd>bnext<CR>", {desc = "Next Buffer"})
keymap.set("n", "bd", "<cmd>bdelete<CR>", {desc = "Delete Buffer"})
keymap.set("n", "<space>hd", "<cmd>noh<CR>", {desc = "Clear Highlights"})
