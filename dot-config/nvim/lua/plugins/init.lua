return {
	"andweeb/presence.nvim",
	"xiyaowong/transparent.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"numToStr/Comment.nvim",
	"windwp/nvim-ts-autotag",
	"mbbill/undotree",
	{
		"altermo/ultimate-autopair.nvim",
		event = {
			"InsertEnter",
			"CmdlineEnter",
		},
		branch = "v0.6", -- recommended as each new version will have breaking changes
		opts = {
			-- Config goes here
		},
	},
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
		config = function()
			require("neoconf").setup()
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		-- event = 'VimEnter',
		config = function()
			require("dashboard").setup({
				-- config
			})
		end,
		dependencies = {
			{
				"nvim-tree/nvim-web-devicons",
			},
		},
	},
}
