local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup = function(server)
    require('lspconfig')[server].setup({
        capabilities = lsp_capabilities
    })

end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "clangd",
        "eslint",
        "html",
        "lua_ls",
        "rust_analyzer",
        "tailwindcss",
        "tsserver",
        "typos_lsp"

    },
    handlers = {
        default_setup
    }
})

local required_formatters = {
    "black",
    "clang-format",
    "luaformatter",
    "prettier"
}

for _, value in pairs(required_formatters) do
    if not require("mason-registry").is_installed(value) then
        vim.cmd("MasonInstall " .. value)
    end
end
