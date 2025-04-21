local opt = vim.opt

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

opt.foldmethod = "indent"
vim.o.foldtext = ""
vim.o.foldlevelstart = 99
vim.o.foldlevel = 99
vim.o.foldenable = true
vim.o.conceallevel = 2

vim.o.winborder = "single"

opt.fillchars = { eob = " " }

opt.ignorecase = true
opt.smartcase = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true
opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 10
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 500

vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

vim.diagnostic.config({
	float = { enable = false },
})

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.cursorline = true

vim.o.laststatus = 0
vim.o.cmdheight = 0

opt.autowriteall = true
