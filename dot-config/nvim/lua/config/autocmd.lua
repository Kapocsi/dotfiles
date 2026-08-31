-- Enable treesitter highlighting and auto-install parsers on FileType.
-- Replaces the old nvim-treesitter `highlight.enable` and `auto_install` options.
vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)
		if lang and require("nvim-treesitter.parsers")[lang] then
			require("nvim-treesitter").install({ lang })
		end
		pcall(vim.treesitter.start)
	end,
})
