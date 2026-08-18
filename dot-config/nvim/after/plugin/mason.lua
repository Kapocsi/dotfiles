local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
	capabilities = lsp_capabilities,
})

vim.lsp.config("sqlls", {
	filetypes = {
		"sql",
	},
	root_dir = function(_, on_dir)
		on_dir(vim.uv.cwd())
	end,
})

vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
})

vim.lsp.config("pyright", {
	settings = {
		pyright = {
			autoImportCompletion = true,
		},
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "basic",
			},
		},
	},
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		-- Asm lang
		"asm_lsp",
		-- C/C++
		"clangd",
		-- JS/TS
		"eslint",
		"ts_ls",
		"html",
		"tailwindcss",
		"jsonls",
		-- Lua
		"lua_ls",
		-- Rust
		"rust_analyzer",
		-- Python
		"pyright",
		-- Generic
		"typos_lsp",
		-- Go
		"gopls",
		-- Bash
		"bashls",
		-- Markdown
		"marksman",
		-- SQL
		"sqlls",
		-- TeX
		"texlab",
		-- Java
		"jdtls",
	},
	-- stylua/formatters are installed via mason but are not language servers we
	-- want auto-enabled as LSP clients.
	automatic_enable = {
		exclude = { "stylua" },
	},
})

-- Because ensure_installed does not have support for everything
local mason_requires = {
	"ruff",
	"clang-format",
	"stylua",
	"prettier",
	"shfmt",
}

vim.schedule(function()
	for _, value in pairs(mason_requires) do
		if not require("mason-registry").is_installed(value) then
			vim.cmd("MasonInstall " .. value)
		end
	end
end)
