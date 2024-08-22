require("neoconf").setup()
require("Comment").setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
require("ts_context_commentstring").setup({})
require("transparent").setup({ groups = { "foobar" } })
require("transparent").setup()
