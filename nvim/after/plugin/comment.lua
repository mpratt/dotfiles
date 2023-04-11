local ts = require("ts_context_commentstring.integrations.comment_nvim")
require('Comment').setup({
    padding = true,
    ignore = "^$",
    mappings = {
        basic = false,
        extra = false,
        extended = false,
    },

    pre_hook = ts.create_pre_hook(),
    post_hook = nil,
})
