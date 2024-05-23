vim.filetype.add({
    pattern = {
        ['.*tmpl'] = function(path)
            local base_name = path:match('.*/(.+)%.tmpl$')
            vim.print(base_name)
            if base_name then
                local filetype = vim.filetype.match({
                    filename = base_name
                })

                vim.print(filetype)
                return filetype
            end
        end
    }
})

---@diagnostic disable-next-line: missing-parameter
require'nvim-ts-autotag'.setup()
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    sync_install = false,
    auto_install = true,
    ignore_install = {},

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    modules = {}
}
