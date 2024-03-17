return {
    {
        "rafamadriz/friendly-snippets"
    },
    -- Helpers for formatting and linting
    "https://github.com/mhartington/formatter.nvim",
    "https://github.com/mfussenegger/nvim-lint",
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = {
            "rafamadriz/friendly-snippets"
        }
    },
    "https://github.com/nvim-treesitter/nvim-treesitter"
}
