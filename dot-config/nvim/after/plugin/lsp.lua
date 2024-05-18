require("luasnip.loaders.from_vscode").lazy_load()

vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(args)
        local bufnr = args.buf

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
                u = {
                    require("fzf-lua").lsp_incoming_calls,
                    "View Usages"

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
                    require("fzf-lua").lsp_references,

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
                },
                d = {
                    function() vim.diagnostic.open_float() end,
                    "View Diagnostic"
                }
            }

        }, opts)

    end
})
