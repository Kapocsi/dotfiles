require("luasnip.loaders.from_vscode").lazy_load()
local fzf_lua = require("fzf-lua")

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

        require("which-key").register({
            ['K'] = {
                function() vim.lsp.buf.hover() end,
                'Hover Diagnostic'
            },
            ["g"] = {
                d = {
                    fzf_lua.lsp_definitions,
                    'Jump Definition'
                },
                D = {
                    fzf_lua.lsp_declarations,
                    'Jump Declaration'
                },
                u = {
                    fzf_lua.lsp_incoming_calls,
                    "View Usages"
                },
                i = {
                    fzf_lua.lsp_implementations,
                    'View Implementation'
                },
                o = {
                    fzf_lua.type_definitions,
                    'Jump Type Definition'
                },
                r = {
                    fzf_lua.lsp_references,
                    'View References'
                },
                s = {
                    vim.lsp.buf.signature_help,
                    'Signature Help'
                }
            },
            ["<leader>l"] = {
                r = {
                    vim.lsp.buf.rename,
                    'Rename'
                },
                a = {
                    fzf_lua.lsp_code_actions,
                    'Code Action'
                },
                d = {
                    vim.diagnostic.open_float,
                    "View Diagnostic"
                }
            }

        }, opts)

    end
})
