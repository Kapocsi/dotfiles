local wk = require("which-key")
local telescope = require("telescope.builtin")
local fzf_lua = require("fzf-lua")

local function is_git_directory()
    -- Use Neovim's vim.fn.system to execute the git command
    -- and check if the current directory is inside a git work tree
    local result = vim.fn.system('git rev-parse --is-inside-work-tree')

    -- Trim the newline character from the output for accurate comparison
    result = result:gsub('%s+', '')

    -- Check the result of the command. If it's 'true', it means we're in a git directory
    if result == 'true' then
        print('This is a git directory.')
        return true
    else
        print('This is not a git directory.')
        return false
    end
end

local function get_git_root()
    local result = vim.fn.system('git rev-parse --show-toplevel')

    result = result:gsub('%s+', '')

    if (string.len(result) > 0) then
        return result
    else
        return nil
    end
end

local function cwd_get()
    local git_dir = get_git_root();

    if (git_dir ~= nil) then
        return git_dir
    else
        return vim.fn.getcwd()
    end
end

wk.register({
    ["<A-Right>"] = {
        "<cmd>bn<cr>",
        "Buffer Next"
    },
    ["<A-Left>"] = {
        "<cmd>bp<cr>",
        "Buffer Previous"
    }

})

wk.register({
    f = {
        name = "find", -- optional group name
        F = {
            function()
                fzf_lua.files {
                    cwd = cwd_get() -- Traverse to the root of the project if needed

                }
            end,
            "Find File"
        },
        f = {
            function()
                if (is_git_directory()) then
                    fzf_lua.git_files({
                        cwd = cwd_get()
                    })
                else
                    fzf_lua.files({
                        cwd = cwd_get()
                    })
                end
            end,
            "Find File"
        },
        s = {
            fzf_lua.live_grep, -- telescope.live_grep,
            "Find File"
        },
        b = {
            fzf_lua.buffers,
            "Find Buffer"
        },
        S = {
            fzf_lua.lsp_workspace_symbols,
            "Find Workspace Symbol"

        }
    },
    ["|"] = {
        "<cmd>vsplit<cr>",
        "Vertical Split"
    },
    ['"'] = {
        "<cmd>split<cr>",
        "Split"
    },
    u = {
        "<cmd>UndotreeToggle<CR>",
        "Undo Tree"
    },
    ["/"] = {
        function()
            require("Comment.api").toggle.linewise.count(vim.v.count > 0 and
                                                             vim.v.count or 1)
        end,
        "Comment Line"
    }

}, {
    prefix = "<leader>"
})

wk.register({
    J = {
        ":m '>+1<CR>gv=gv",
        "Move Block"
    },
    K = {
        ":m '<-2<CR>gv=gv",
        "Move Block"
    },
    ["<leader>/"] = {
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        "Comment Block"

    },
    ["<Tab>"] = {
        ">gv",
        "Tabin"
    },
    ["<S-Tab>"] = {
        "<gv",
        "Tabout"
    }

}, {
    mode = "v"
})
