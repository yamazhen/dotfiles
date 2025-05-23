local autocmd = vim.api.nvim_create_autocmd
local opts = { buffer = true, silent = true }
local keymap = vim.keymap.set

-- helper to disable fzf-lua
local function disablePicker()
	keymap({ "n", "v" }, "<leader>ff", "<nop>", opts)
	keymap({ "n", "v" }, "<leader>fs", "<nop>", opts)
	keymap({ "n", "v" }, "<leader>fb", "<nop>", opts)
	keymap({ "n", "v" }, "<leader>sr", "<nop>", opts)
end

-- prevent auto commenting new lines
autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- prevent opening buffers in plugin windows
-- by unmapping fzf-lua keybinds in these filetypes
autocmd("FileType", {
	pattern = { "lazy", "oil", "mason", "trouble" },
	callback = function()
		disablePicker()
	end,
})

-- wrap lines in markdown
autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
	end,
})

-- list of languages that use 2 spaces for indentation
local two_indent = {
	"typescriptreact",
	"javascript",
	"typescript",
	"javascriptreact",
	"html",
	"css",
	"json",
	"jsonc",
	"dart",
	"swift",
	"yaml",
	"c",
	"sql",
}

-- follow indent convention of the language
autocmd("FileType", {
	pattern = two_indent,
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
	end,
})

-- nvim_treesitter#foldexpr is not working for html
autocmd("FileType", {
	pattern = "html",
	callback = function()
		vim.opt_local.foldmethod = "indent"
	end,
})
