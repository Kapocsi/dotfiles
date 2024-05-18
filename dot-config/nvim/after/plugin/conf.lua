require("neoconf").setup();
require("neodev").setup();
require('nvim-ts-autotag').setup()
require('Comment').setup({
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
})
require('ts_context_commentstring').setup({})
require("bufferline").setup {}
require("transparent").setup()
