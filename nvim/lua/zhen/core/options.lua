local opt = vim.opt

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

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

opt.updatetime = 50

vim.schedule(function ()
    opt.clipboard = "unnamedplus"
end)

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0

vim.g.bigfile_size = 1024 * 1024 * 1.5

vim.o.cmdheight = 0
