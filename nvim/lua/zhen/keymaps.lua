local function create_todays_note()
	local date = os.date("%Y-%m-%d")
	local dir = vim.fn.expand("~/notes/daily/")
	local path = dir .. date .. ".md"

	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	end

	vim.cmd("e " .. path)
end

vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>z", "za", opts)
keymap("n", "<leader>mp", "ggVG=", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>l", "<C-w>l", opts)
keymap("n", "<leader>L", "<cmd>LspInstall<CR>", opts)
keymap("n", "<leader>sh", "<cmd>split<CR>", opts)
keymap("n", "<leader>sv", "<cmd>vsplit<CR>", opts)
keymap("n", "<leader>x", "<cmd>close<CR>", opts)
keymap("n", "<leader>bd", "<cmd>bd<CR>", opts)

-- center cursor
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

keymap("n", "J", "mzJ`z", opts)
keymap("i", "<C-c>", "<Esc>", opts)

keymap("n", "<leader>jn", create_todays_note, opts)
