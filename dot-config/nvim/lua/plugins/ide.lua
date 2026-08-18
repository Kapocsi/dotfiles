local function is_program_installed(program_name)
	-- Get the PATH environment variable
	local path_env = os.getenv("PATH")
	if not path_env then
		return false -- PATH is not set
	end

	-- Split PATH into individual directories
	for path_dir in path_env:gmatch("[^:]+") do
		local full_path = path_dir .. "/" .. program_name
		-- Check if the file exists and is executable
		local file = io.open(full_path, "r")
		if file then
			file:close()
			return true
		end
	end

	return false
end

local pdf_previwer = is_program_installed("zathura") and "zathura" or "skim"

return {
{ 
    "danymat/neogen", 
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*" 
},
	-- mason moved orgs: williamboman/* is deprecated in favour of mason-org/*
	"mason-org/mason.nvim",
	"mason-org/mason-lspconfig.nvim",
	{
		-- Modern completion engine, replaces the (now unmaintained) nvim-cmp
		-- stack (hrsh7th/nvim-cmp + cmp-* sources).
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = { "L3MON4D3/LuaSnip" },
		-- Setup lives in after/plugin/cmp.lua
	},
	{
		-- Formatter, replaces the older mhartington/formatter.nvim
		"stevearc/conform.nvim",
		-- Setup lives in after/plugin/nvim-formatter.lua
	},
	{
		"ibhagwan/fzf-lua",
		config = function()
			require("fzf-lua").setup({})
			-- Use fzf-lua as the vim.ui.select backend (replaces dressing.nvim)
			require("fzf-lua").register_ui_select()
		end,
	},
	"mfussenegger/nvim-lint",
	{
		"FabijanZulj/blame.nvim",
		config = function()
			require("blame").setup({
				merge_consecutive = true,
				blame_options = { "-w", "-C", "-C", "-C" },
			})
		end,
	},
	"neovim/nvim-lspconfig",
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = pdf_previwer
		end,
	},
}
