vim.opt.foldcolumn = "1" -- Show fold column
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.cmd([[
    highlight Folded guibg=none guifg=none
]])

return {
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
	},
	--- Make nerdfonts easier to type
	{
		"2kabhishek/nerdy.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		cmd = "Nerdy",
	},
	{
		"catgoose/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		-- Maintained fork of the archived ruifm/gitlinker.nvim
		"linrongbin16/gitlinker.nvim",
		cmd = "GitLink",
		opts = {},
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			require("ufo").setup({
				provider_selector = function(_, _, _)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		-- Setup lives in after/plugin/treesitter.lua
	},
}
