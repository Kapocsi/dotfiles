-- nvim-treesitter `main` branch (the `master` branch is frozen and breaks on
-- Neovim 0.11+). The API is completely different: there is no more
-- `require("nvim-treesitter.configs").setup()`. Instead we install parsers
-- explicitly and turn highlighting/indent on per-buffer via `vim.treesitter`.

local ts = require("nvim-treesitter")

-- Auto close/rename HTML/JSX tags (works independently of the treesitter API).
---@diagnostic disable-next-line: missing-parameter
require("nvim-ts-autotag").setup()

-- Parsers to keep installed. `master`'s `ensure_installed = "all"` is gone on
-- `main` (it was also what tried to download the broken `ipkg` parser).
local ensure_installed = {
	"asm",
	"bash",
	"c",
	"cpp",
	"css",
	"diff",
	"dockerfile",
	"git_config",
	"gitcommit",
	"go",
	"graphql",
	"html",
	"java",
	"javascript",
	"json",
	"latex",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"regex",
	"rust",
	"scss",
	"sql",
	"ssh_config",
	"svelte",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"vue",
	"yaml",
	"zig",
}

-- Install any missing parsers asynchronously on startup.
ts.install(ensure_installed)

-- Enable treesitter highlighting + indentation for any buffer whose filetype has
-- a parser available (installed or bundled with Neovim).
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
	callback = function(args)
		local buf = args.buf
		local ft = vim.bo[buf].filetype
		local lang = vim.treesitter.language.get_lang(ft)
		if not lang then
			return
		end

		-- `language.add` succeeds only when a parser is actually available.
		local ok = pcall(vim.treesitter.language.add, lang)
		if not ok then
			return
		end

		pcall(vim.treesitter.start, buf, lang)
		-- Treesitter-based indentation (opt-in on the main branch).
		vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
