vim.filetype.add({
    pattern = {
        -- Use the correct syntax highlighting for the ssh config template, 
        -- this is stupid but I can't seem to match using the files "path"
        ["dot%-ssh/config%.tmpl"] = "ssh_config",
        -- Try to match using a file without the .tmpl extension
        ['.*tmpl'] = function(path)
            local base_name = path:match('.*/(.+)%.tmpl$')
            if base_name then
                local filetype = vim.filetype.match({
                    filename = base_name
                })
                return filetype
            end
        end,
        -- Explicit override for the dot-zsh files, these don't match because a 
        -- literal "." is expected instead 
        ["dot%-zsh.*"] = "zsh"
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
