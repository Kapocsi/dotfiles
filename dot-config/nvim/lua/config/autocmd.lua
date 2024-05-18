vim.api.nvim_create_augroup("dashboard_open", {
    clear = true
});

vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
        focusable = false
    })

-- vim.api.nvim_create_autocmd("VimEnter", {
--     desc = "Open Dashboard",
--     group = "dashboard_open",
--     once = true,
--     callback = function()
--         if not vim.g.dashboard_opened then
--             -- vim.cmd "Dashboard"
--             if vim.fn.argc() > 0 then vim.cmd "Neotree show" end
--             vim.g.dashboard_opened = true
--         end
--     end
-- })

-- vim.api.nvim_create_autocmd("CursorHold", {
--     callback = function()
--         vim.diagnostic.open_float({
--             focusable = false
--         })
--     end
-- })
-- 
