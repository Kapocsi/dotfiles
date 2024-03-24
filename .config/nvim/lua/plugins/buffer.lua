return {
    "rafamadriz/friendly-snippets",
    "mhartington/formatter.nvim",
    "mfussenegger/nvim-lint",
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = {
            "rafamadriz/friendly-snippets"
        }
    },
    "nvim-treesitter/nvim-treesitter"
}
