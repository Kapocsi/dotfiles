-- Completion via blink.cmp (replaces nvim-cmp + cmp-* sources).
-- Docs: https://cmp.saghen.dev/
require("blink.cmp").setup({
	-- 'default' preset roughly matches the old nvim-cmp keymaps:
	--   <C-space> open/toggle, <C-e> hide, <CR> accept,
	--   <C-n>/<C-p> or arrows to select, <C-y> accept.
	keymap = {
		preset = "default",
		-- Enter confirms the selected item, like the old <CR> mapping.
		["<CR>"] = { "accept", "fallback" },
		["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = { auto_show = true },
	},

	-- LSP > snippets (luasnip) > path > buffer, mirroring the old priorities.
	sources = {
		default = { "lsp", "snippets", "path", "buffer" },
	},

	snippets = { preset = "luasnip" },

	-- Rust fuzzy matcher with a Lua fallback (prebuilt binary via version = "1.*").
	fuzzy = { implementation = "prefer_rust_with_warning" },

	signature = { enabled = true },
})
