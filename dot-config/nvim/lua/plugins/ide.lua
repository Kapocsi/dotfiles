return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	"VonHeikemen/lsp-zero.nvim",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"stevearc/dressing.nvim",
	{
		"ibhagwan/fzf-lua",
		config = function()
			require("fzf-lua").setup({})
		end,
	},
	"mfussenegger/nvim-lint",
	{
		"FabijanZulj/blame.nvim",
		config = function()
			require("blame").setup()
		end,
	},
	"neovim/nvim-lspconfig",
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = "skim"
		end,
	},
}
