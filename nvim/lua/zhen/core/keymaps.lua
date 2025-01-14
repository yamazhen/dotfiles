vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>z", "za", { noremap = true, silent = true })
keymap("x", "<leader>p", [["_dP]], opts)
keymap("n", "<leader><Left>", "<C-o>", opts)
keymap("n", "<leader><Right>", "<C-i>", opts)
keymap("n", "<leader>mp", "ggVG=", opts)
keymap("n", "<leader>ee", "<CMD>Ex<CR>", opts)
keymap("n", "<leader><Up>", "<C-w>k", opts)
keymap("n", "<leader><Down>", "<C-w>j", opts)
keymap("n", "<leader>ml", "<cmd>LspInstall<CR>", { desc = "Install LSP for this filetype" })

-- fzf
keymap({ "n", "t" }, "<leader>ff", fzf.files, { noremap = true, silent = true })
keymap({ "n", "t" }, "<leader>fs", fzf.live_grep, { noremap = true, silent = true })
keymap({ "n", "t" }, "<leader>fg", fzf.git_files, { noremap = true, silent = true })
keymap({ "n", "t" }, "<leader>fb", fzf.buffers, { noremap = true, silent = true })

-- lsp
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf, noremap = true, silent = true }
		local fzf = require("fzf-lua")
		keymap("n", "<leader>sd", vim.lsp.buf.definition, opts)
		keymap("n", "<leader>sr", fzf.lsp_references, opts)
		keymap("n", "<leader>si", vim.lsp.buf.code_action, opts)
		keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
		keymap("n", "<leader>md", vim.diagnostic.open_float, opts)
		keymap("n", "<leader>mD", fzf.diagnostics_document, { noremap = true, silent = true })
	end,
})
