local formatters = require("formatter.defaults")

require("formatter").setup({
	log_level = vim.log.levels.WARN,
	filetype = {
		tex = function()
			return {
				exe = "latexindent",
				stdin = true,
			}
		end,
		lua = require("formatter.filetypes.lua").stylua,
		rust = require("formatter.filetypes.rust").rustfmt,
		cpp = require("formatter.filetypes.cpp").clangformat,
		c = require("formatter.filetypes.c").clangformat,
		python = require("formatter.filetypes.python").black,

		-- JS Land
		javascript = formatters.prettier,
		javascriptreact = formatters.prettier,
		typescript = formatters.prettier,
		typescriptreact = formatters.prettier,
		css = formatters.prettier,
		scss = formatters.prettier,
		less = formatters.prettier,
		html = formatters.prettier,
		json = formatters.prettier,
		yaml = formatters.prettier,
		markdown = formatters.prettier,
		graphql = formatters.prettier,
		vue = formatters.prettier,
		svelte = formatters.prettier,

		sh = formatters.beautysh,
		zsh = formatters.beautysh,
	},
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", {
	clear = true,
})
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWriteLock",
})
