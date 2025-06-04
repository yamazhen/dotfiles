local function note(yesterday)
	local target_time = yesterday and (os.time() - 24 * 60 * 60) or os.time()
	local date = os.date("%Y-%m-%d", target_time)
	local dir = vim.fn.expand("~/notes/daily/")
	local path = dir .. date .. ".md"

	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	end

	if yesterday then
		local stat = vim.loop.fs_stat(path)
		if not stat then
			vim.notify("No note found for yesterday", vim.log.levels.WARN)
			return
		end
	end

	vim.cmd("e " .. path)
end

vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>z", "za", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>l", "<C-w>l", opts)
keymap("n", "<leader>L", "<cmd>LspInstall<CR>", opts)
keymap("n", "<leader>sh", "<cmd>split<CR>", opts)
keymap("n", "<leader>sv", "<cmd>vsplit<CR>", opts)
keymap("n", "<leader>x", "<cmd>close<CR>", opts)

-- center cursor
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

keymap("n", "J", "mzJ`z", opts)

keymap("n", "<leader>nt", note, opts)
keymap("n", "<leader>ny", function()
	note(true)
end, opts)

-- insert kirby when im in cmdline
keymap("c", "<C-s>", "\\(.*\\)")
