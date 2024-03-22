require("luasnip.loaders.from_vscode").lazy_load()

vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        local opts = {
            buffer = bufnr
        }

        require"which-key".register({
            ["la"] = {
                function() vim.lsp.buf.code_action() end,
                'Code Action'
            }
        }, {
            prefix = "<leader>",
            mode = "v"
        });

        require("which-key").register({
            ['K'] = {
                function() vim.lsp.buf.hover() end,
                'Hover Diagnostic'
            },
            ["g"] = {
                d = {
                    function() vim.lsp.buf.definition() end,
                    'Jump Definition'
                },
                D = {
                    function() vim.lsp.buf.declaration() end,
                    'Jump Declaration'
                },
                i = {
                    function() vim.lsp.buf.implementation() end,
                    'View Implementation'
                },
                o = {
                    function() vim.lsp.buf.type_definition() end,
                    'Jump Type Definition'
                },
                r = {
                    function() vim.lsp.buf.references() end,
                    'View References'
                },
                s = {
                    function() vim.lsp.buf.signature_help() end,
                    'Signature Help'
                }
            },
            ["<leader>l"] = {
                r = {
                    function() vim.lsp.buf.rename() end,
                    'Rename'
                },
                a = {
                    function() vim.lsp.buf.code_action() end,
                    'Code Action'
                }
            }

        }, opts)

    end
})
