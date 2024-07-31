vim.g.mapleader = ' '

local keymap = vim.keymap

keymap.set('x', '<leader>p', '\'_dP')
keymap.set('n', '<leader><Left>', '<CMD>bprevious<CR>')
keymap.set('n', '<leader><Right>', '<CMD>bnext<CR>')
keymap.set('n', '<leader>mp', 'ggVG=')
