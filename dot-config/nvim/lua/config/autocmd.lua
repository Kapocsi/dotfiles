vim.api.nvim_create_augroup("dashboard_open", {
    clear = true
});

vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
        focusable = false
    })
