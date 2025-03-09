local autocmd = vim.api.nvim_create_autocmd
local opts = { buffer = true, silent = true }
local keymap = vim.keymap.set

local function disablePicker()
	keymap({ "n", "v" }, "<leader>ff", "<nop>", opts)
end

local function quit()
	vim.cmd("q")
end

local function forceQuit()
	vim.cmd("q!")
end

autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

autocmd("FileType", {
	pattern = "oil",
	callback = function()
		keymap("n", "q", forceQuit, opts)
		disablePicker()
	end,
})

autocmd("FileType", {
	pattern = "snipe-menu",
	callback = function()
		keymap("n", "q", quit, opts)
		disablePicker()
	end,
})

autocmd("FileType", {
	pattern = "lazy",
	callback = function()
		keymap("n", "<Esc>", quit, opts)
		disablePicker()
	end,
})
