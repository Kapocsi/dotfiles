vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd([[
    highlight Folded guibg=none guifg=none
]])

vim.opt.foldcolumn = "1" -- Show fold column
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

return {
	"LunarVim/bigfile.nvim",
	"mhartington/formatter.nvim",
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
	},
	"nvim-treesitter/nvim-treesitter",
	--- Make nerdfonts easier to type
	{
		"2kabhishek/nerdy.nvim",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-telescope/telescope.nvim",
		},
		cmd = "Nerdy",
	},
	"jose-elias-alvarez/nvim-lsp-ts-utils",
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"ruifm/gitlinker.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},

		config = function()
			require("gitlinker").setup()
		end,
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
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = { "lua", "javascript", "python", "c", "cpp" }, -- Add your languages
				incremental_selection = { enable = true },
				fold = { enable = true },
			})
		end,
	},
}
