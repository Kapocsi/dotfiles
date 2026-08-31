return {
	"folke/which-key.nvim",
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{
				"<leader>e",
				"<cmd>Neotree toggle<cr>",
				desc = "NeoTree",
			},
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
					},
				},
				event_handlers = {
					{
						event = "neo_tree_popup_input_ready",
						handler = function(args)
							vim.cmd("stopinsert")
							vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
						end,
					},
				},
			})
		end,
		cmd = "Neotree",
	},
}
