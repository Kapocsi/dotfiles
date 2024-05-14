vim.filetype.add({
    pattern = {
        ['.*%.tmpl$'] = function(path, bufnr)
            local base_name = path:match('(.+)%.tmpl$')
            if base_name then
                local filetype = vim.filetype.match({
                    filename = base_name
                })
                return filetype
            end
        end
    }
})

require'nvim-treesitter.configs'.setup {
    ensure_installed = {},
    modules = {},
    ignore_install = {},

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },

    autotag = {
        enable = true
    }
}
