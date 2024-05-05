require'nvim-treesitter.configs'.setup {
    ensure_installed = {},
    modules = {},
    ignore_install = {},

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = false,
        additional_vim_regex_highlighting = false
    },

    autotag = {
        enable = true
    }
}
