local wk = require("which-key")
local fzf_lua = require("fzf-lua")
local comments = require("Comment.api")

local function get_git_root()
	local result = vim.fn.system("git rev-parse --show-toplevel")

	-- Trim the whitespace(s) from the end of the line
	result = result:gsub("%s+$", "")

	if string.len(result) > 0 then
		return result
	else
		return nil
	end
end

local function cwd_get()
	local git_dir = get_git_root()

	if git_dir ~= nil then
		return git_dir
	else
		return vim.fn.getcwd()
	end
end

wk.add({
	{ "<A-Left>", "<cmd>bp<cr>", desc = "Buffer Previous" },
	{ "<A-Right>", "<cmd>bn<cr>", desc = "Buffer Next" },
	{ '<leader>"', "<cmd>split<cr>", desc = "Split" },
	{
		"<leader>/",
		function()
			comments.toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
		end,
		desc = "Comment Line",
	},
	{ "<leader>f", group = "find" },
	{ "<leader>fS", fzf_lua.lsp_workspace_symbols, desc = "Find Workspace Symbol" },
	{ "<leader>fb", fzf_lua.buffers, desc = "Find Buffer" },
	{
		"<leader>ff",
		function()
			fzf_lua.files({
				cwd = cwd_get(), -- Traverse to the root of the project if needed
			})
		end,
		desc = "Find File",
	},
	{ "<leader>fs", fzf_lua.live_grep, desc = "Find File" },
	{ "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undo Tree" },
	{ "<leader>|", "<cmd>vsplit<cr>", desc = "Vertical Split" },
	{ "z=", fzf_lua.spell_suggest, desc = "Fix Spelling" },
})

wk.add({
	mode = "v",
	{ "<S-Tab>", "<gv", desc = "Tabout" },
	{ "<Tab>", ">gv", desc = "Tabin" },
	{
		"<leader>/",
		"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
		desc = "Comment Block",
	},
	{ "J", ":m '>+1<CR>gv=gv", desc = "Move Block" },
	{ "K", ":m '<-2<CR>gv=gv", desc = "Move Block" },
})
