return {
    "https://github.com/andweeb/presence.nvim",

    "https://github.com/xiyaowong/transparent.nvim",
    "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
    "https://github.com/numToStr/Comment.nvim",
    "https://github.com/windwp/nvim-ts-autotag",
    {
        'altermo/ultimate-autopair.nvim',
        event = {
            'InsertEnter',
            'CmdlineEnter'
        },
        branch = 'v0.6', -- recommended as each new version will have breaking changes
        opts = {
            -- Config goes here
        }
    },

    {
        "folke/neoconf.nvim",
        cmd = "Neoconf"
    },
    "https://github.com/mbbill/undotree",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
        dependencies = {
            {
                'nvim-tree/nvim-web-devicons'
            }
        }
    }
}
