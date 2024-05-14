local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local util = require("lspconfig/util")
require("lspconfig.configs").pylyzer = {
    default_config = {
        name = "pylyzer",
        cmd = {
            "pylyzer",
            "--server"
        },
        filetypes = {
            "python"
        },
        root_dir = function(fname)
            local root_files = {
                "pyproject.toml",
                "setup.py",
                "setup.cfg",
                "requirements.txt",
                "Pipfile"
            }
            return util.root_pattern(unpack(root_files))(fname) or
                       util.find_git_ancestor(fname) or util.path.dirname(fname)
        end
    }
}

local default_setup = function(server)
    require('lspconfig').clangd.setup {
        capabilities = lsp_capabilities,
        cmd = {
            "clangd",
            "--offset-encoding=utf-16"
        }
    }

    require('lspconfig')[server].setup({
        capabilities = lsp_capabilities
    })

end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        -- Asm lang
        "asm_lsp",
        -- C/C++
        "clangd",
        --  
        "eslint",
        "tsserver",
        "html",
        "tailwindcss",
        --   
        "lua_ls",
        --  
        "rust_analyzer",

        --  
        -- "pylsp",
        -- "pyright",
        "pylyzer",

        -- Generic
        "typos_lsp"
    },
    handlers = {
        default_setup
    }
})

-- Because ensure_installed does not have support for everything 
local mason_requires = {
    "black",
    "clang-format",
    "luaformatter",
    "prettier",
    "mypy"
}

-- Install all missing formatters 
for _, value in pairs(mason_requires) do
    if not require("mason-registry").is_installed(value) then
        vim.cmd("MasonInstall " .. value)
    end
end
