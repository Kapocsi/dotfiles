local wk = require("which-key")

wk.register({
    f = {
        name = "find", -- optional group name
        F = {
            "<cmd>Telescope find_files<cr>",
            "Find File"
        },
        f = {
            "<cmd>Telescope git_files<cr>",
            "Find File"
        },
        s = {
            "<cmd>Telescope live_grep<cr>",
            "Find File"
        },
        b = {
            "<cmd>Telescope buffers<cr>",
            "Find Buffer"
        },
        S = {
            "<cmd>Telescope lsp_workspace_symbols<cr>",
            "Find Workspace Symbol"

        }
    },
    ['b'] = {
        name = "buffer",
        b = {
            "<cmd>bp<cr>",
            "Buffer Previous"
        },
        n = {
            "<cmd>bn<cr>",
            "Buffer Next"
        },
        ["|"] = {
            "<cmd>vsplit<cr>",
            "Vertical Split"
        },
        ['"'] = {
            "<cmd>split<cr>",
            "Split"
        }

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

-- --- Commenting in visualmode
-- vim.keymap.set("v", "<leader>/",
--                "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")

-- vim.keymap.set("v", "<Tab>", ">gv")
-- vim.keymap.set("v", "<S-Tab>", "<gv")
