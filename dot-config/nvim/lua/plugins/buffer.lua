return {
    "rafamadriz/friendly-snippets",
    "mhartington/formatter.nvim",
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = {
            "rafamadriz/friendly-snippets"
        }
    },
    "nvim-treesitter/nvim-treesitter",
    --- Make nerdfonts easier to type
    {
        '2kabhishek/nerdy.nvim',
        dependencies = {
            'stevearc/dressing.nvim',
            'nvim-telescope/telescope.nvim'
        },
        cmd = 'Nerdy'
    },
    "jose-elias-alvarez/nvim-lsp-ts-utils"
}
