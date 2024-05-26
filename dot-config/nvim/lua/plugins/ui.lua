return {
    {
        'nvimdev/dashboard-nvim',
        config = function() require('dashboard').setup {} end,
        lazy = false
    },
    "folke/which-key.nvim",
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
        keys = {
            {
                "<leader>e",
                "<cmd>Neotree toggle<cr>",
                desc = "NeoTree"
            }
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                enable_normal_mode_for_inputs = true,
                filesystem = {
                    filtered_items = {
                        hide_dotfiles = false
                    }
                }
            })
        end,
        cmd = "Neotree"
    }
}
