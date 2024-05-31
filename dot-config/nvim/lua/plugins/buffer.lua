return {
    "mhartington/formatter.nvim",
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp"
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
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    {
        "norcalli/nvim-colorizer.lua",
        config = function() require"colorizer".setup() end
    },
    {
        'ruifm/gitlinker.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'

        },

	config = function()
		require"gitlinker".setup()
	end
    }

}
