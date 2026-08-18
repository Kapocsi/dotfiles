-- Formatting via conform.nvim (replaces mhartington/formatter.nvim).
require("conform").setup({
	formatters_by_ft = {
		tex = { "latexindent" },
		lua = { "stylua" },
		rust = { "rustfmt" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		glsl = { "clang-format" },
		python = { "black" },

		-- JS land
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		less = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		graphql = { "prettier" },
		vue = { "prettier" },
		svelte = { "prettier" },

		sh = { "beautysh" },
		zsh = { "beautysh" },
	},

	-- Format on save, falling back to LSP formatting when no formatter is set.
	format_on_save = {
		timeout_ms = 3000,
		lsp_format = "fallback",
	},

	formatters = {
		-- Preserve the old markdown prose wrapping behaviour (prettier only
		-- applies --prose-wrap to markdown/mdx, so this is safe globally).
		prettier = {
			prepend_args = { "--prose-wrap=always" },
		},
	},
})
