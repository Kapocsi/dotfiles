vim.wo.nu = true
vim.wo.relativenumber = true

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- persistent undo
vim.opt.undodir = "/tmp/nvim_undo"
vim.opt.undofile = true

vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 40

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

-- Fix colorizer issue
vim.opt.termguicolors = true
