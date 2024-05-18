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
