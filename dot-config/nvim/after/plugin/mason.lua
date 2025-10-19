local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").sqlls.setup({
	capabilities = lsp_capabilities,
	filetypes = {
		"sql",
	},
	root_dir = function(_)
		return vim.loop.cwd()
	end,
})

local lspconfig = require("lspconfig")

local default_setup = function(server)
	---@diagnostic disable: missing-fields
	lspconfig.clangd.setup({
		capabilities = lsp_capabilities,
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
		},
	})

	lspconfig.pyright.setup({
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

	lspconfig.ts_ls.setup({
		init_options = require("nvim-lsp-ts-utils").init_options,
		on_attach = function(client, bufnr)
			local ts_utils = require("nvim-lsp-ts-utils")
			ts_utils.setup({})
		end,
	})

	---@diagnostic enable: missing-fields

	lspconfig[server].setup({
		capabilities = lsp_capabilities,
	})
end

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		-- Asm lang
		"asm_lsp",
		-- C/C++
		"clangd",
		-- 
		"eslint",
		"ts_ls",
		"html",
		"tailwindcss",
		"jsonls",
		-- 
		"lua_ls",
		-- 
		"rust_analyzer",

		-- 
		-- "pylsp",
		"pyright",
		-- "basedpyright",
		-- "pylyzer",

		-- Generic
		"typos_lsp",

		-- Go Lang
		"gopls",

		-- Bash Lsp
		"bashls",

		-- Markdown
		"marksman",

		-- SQL
		"sqlls",

		-- TEX
		"texlab",

		-- java
		"jdtls",
	},
	handlers = {
		default_setup,
	},
})

-- Because ensure_installed does not have support for everything
local mason_requires = {
	"black",
	"clang-format",
	"stylua",
	"prettier",
	"shfmt",
}

for _, value in pairs(mason_requires) do
	if not require("mason-registry").is_installed(value) then
		vim.cmd("MasonInstall " .. value)
	end
end
