return {
    {
        'nvimdev/dashboard-nvim',
        config = function() require('dashboard').setup {} end,
        lazy = false
    },

    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
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
    },
    {
        "/nvim-telescope/telescope-ui-select.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim"
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            -- This is your opts table
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    }
}
