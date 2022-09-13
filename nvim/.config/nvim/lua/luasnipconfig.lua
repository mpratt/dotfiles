local ls = require("luasnip")

ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true
}

ls.snippets = {
    all = {
    },
    php = {
        ls.parser.parse_snippet('expand', 'echo "hello world"'),
    }
}

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
