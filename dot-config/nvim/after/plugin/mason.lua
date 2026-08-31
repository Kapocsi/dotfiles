local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

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
	handlers = {
		-- Default: set up each server with shared capabilities
		function(server)
			lspconfig[server].setup({ capabilities = lsp_capabilities })
		end,

		["clangd"] = function()
			lspconfig.clangd.setup({
				capabilities = lsp_capabilities,
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
			})
		end,

		["pyright"] = function()
			lspconfig.pyright.setup({
				capabilities = lsp_capabilities,
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
		end,

		["sqlls"] = function()
			lspconfig.sqlls.setup({
				capabilities = lsp_capabilities,
				filetypes = { "sql" },
				root_dir = function(_)
					return vim.uv.cwd()
				end,
			})
		end,
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
