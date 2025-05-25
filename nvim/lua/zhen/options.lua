local opt = vim.opt
local o = vim.o

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

opt.foldmethod = "manual"

o.winborder = "single"

opt.fillchars = { eob = " " }

opt.ignorecase = true
opt.smartcase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

opt.wrap = false

opt.colorcolumn = "80"

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.numberwidth = 2
opt.updatetime = 500

o.scrolloff = 10

vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

vim.diagnostic.config({
	float = { enable = false },
})

opt.autowriteall = true

opt.splitbelow = true
opt.splitright = true
