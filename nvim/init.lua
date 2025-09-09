local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/nvim-mini/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
end

vim.g.mapleader = " "
vim.o.mouse = ""
vim.o.clipboard = "unnamedplus"
vim.o.colorcolumn = "80"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.fillchars:append({ eob = " " })

local MiniDeps = require("mini.deps")
MiniDeps.setup({ path = { package = path_package } })
MiniDeps.add({ source = "https://github.com/rose-pine/neovim", name = "rose-pine" })
MiniDeps.add({ source = "https://github.com/nvim-treesitter/nvim-treesitter" })
MiniDeps.add({ source = "https://github.com/neovim/nvim-lspconfig" })
MiniDeps.add({ source = "https://github.com/williamboman/mason.nvim" })
MiniDeps.add({ source = "https://github.com/mason-org/mason-lspconfig.nvim" })
MiniDeps.add({ source = "https://github.com/ibhagwan/fzf-lua" })
MiniDeps.add({ source = "https://github.com/Saghen/blink.cmp" })
MiniDeps.add({ source = "https://github.com/tpope/vim-fugitive" })
MiniDeps.add({ source = "https://github.com/stevearc/oil.nvim" })
MiniDeps.add({ source = "https://github.com/stevearc/conform.nvim" })

vim.keymap.set("n", "<leader>g", "<cmd>G<CR>")
vim.keymap.set("n", "<leader>ee", "<cmd>Oil<CR>")
vim.keymap.set("n", "<C-e>", "<cmd>FzfLua files formatter='path.filename_first'<CR>")
vim.keymap.set("n", "<leader>ps", "<cmd>FzfLua grep_project formatter='path.filename_first'<CR>")
vim.keymap.set("n", "<leader>si", "<cmd>FzfLua lsp_code_actions silent=true<CR>")
vim.keymap.set("n", "<leader>sd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>tt", function()
	vim.diagnostic.setloclist({ open = true })
end)
vim.keymap.set("n", "=", function()
	require("conform").format()
end)
