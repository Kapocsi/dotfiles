vim.api.nvim_create_augroup("dashboard_open", {
    clear = true
});

vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
        focusable = false
    })

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'zsh',
    callback = function()
        vim.lsp.start({
            name = 'bash-language-server',
            cmd = {
                'bash-language-server',
                'start'
            }
        })
    end
})
