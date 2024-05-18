require"lint".linters.mypy.args = {
    "--show-column-numbers",
    "--show-error-end",
    "--hide-error-codes",
    "--hide-error-context",
    "--no-color-output",
    "--no-error-summary",
    "--no-pretty",
    "--check-untyped-defs",
    "--ignore-missing-imports"
}

require'lint'.linters_by_ft = {
    python = {
        'mypy'
    }
}

vim.api.nvim_create_autocmd({
    "BufWritePost"
}, {
    callback = function() require("lint").try_lint() end
})
