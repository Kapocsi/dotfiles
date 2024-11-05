vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.loader.enable()
vim.g.mapleader = " "

require("config.default_settings") -- Load Settings
require("lazy").setup("plugins") -- Load Plugins
require("config.keybinds") -- Load keybinds
require("config.autocmd")

vim.cmd.colorscheme("catppuccin")
