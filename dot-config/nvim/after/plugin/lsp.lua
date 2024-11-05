local fzf_lua = require("fzf-lua")

vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(args)
		local buffer = args.buf

		local opts = {
			buffer = buffer,
		}

		require("which-key").add({
			{
				"K",
				function()
					vim.lsp.buf.hover()
				end,
				desc = "Hover Diagnostic",
			},
			{
				"gd",
				fzf_lua.lsp_definitions,
				desc = "Jump Definition",
			},
			{
				"dD",
				fzf_lua.lsp_declarations,
				desc = "Jump Declaration",
			},
			{ "gu", fzf_lua.lsp_incoming_calls, desc = "View Usages" },
			{ "gi", fzf_lua.lsp_implementations, desc = "View Implementation" },
			{ "go", fzf_lua.type_definitions, desc = "Jump Type Definition" },
			{ "gr", fzf_lua.lsp_references, desc = "View References" },
			{ "gs", vim.lsp.buf.signature_help, desc = "Signature Help" },
			{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
			{ "<leader>la", fzf_lua.lsp_code_actions, desc = "Code Action" },
			{ "<leader>ld", vim.diagnostic.open_float, desc = "View Diagnostic" },
		}, { buffer = buffer })
	end,
})
