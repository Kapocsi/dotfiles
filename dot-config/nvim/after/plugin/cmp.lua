local cmp = require("cmp")

cmp.setup({
	sources = {
		{
			name = "nvim_lsp",
			priority = 1000,
		},
		{
			name = "luasnip",
			priority = 750,
		},
		{
			name = "buffer",
			priority = 500,
		},
		{
			name = "path",
			priority = 250,
		},
	},
	mapping = cmp.mapping.preset.insert({
		-- Enter key confirms completion item
		["<CR>"] = cmp.mapping.confirm({
			select = false,
		}),

		-- Ctrl + space triggers completion menu
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})
