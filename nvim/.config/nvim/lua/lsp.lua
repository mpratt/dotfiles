local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local ls = require("luasnip")
ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true
}

ls.snippets = {
    all = { },
    php = { ls.parser.parse_snippet('expand', 'echo "hello world"'), }
}

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })

local cmp = require'cmp'
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = "path" }
    })
})




local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)

    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    server:setup({
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities
    })
end)

-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--
--   local opts = { noremap=true, silent=true }
--   buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   buf_set_keymap('n', '<leader>gy', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   buf_set_keymap('n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   buf_set_keymap('n', '<leader>gD', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   buf_set_keymap('n', '<leader>go', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   buf_set_keymap('n', '<leader>gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
--   buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   buf_set_keymap('n', '<leader>g[', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
--   buf_set_keymap('n', '<leader>g]', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
--   buf_set_keymap('n', '<leader>gt', '<Cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
--   buf_set_keymap('n', '<leader>ge', '<Cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', opts)
--   buf_set_keymap('n', '<leader>g=', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
--
-- end
--
-- local lsp_installer = require("nvim-lsp-installer")
-- lsp_installer.on_server_ready(function(server)
--     local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--     local opts = {
--         capanilities = capabilities,
--         on_attach = on_attach,
--         flags = { debounce_text_changes = 150 }
--     }
--     server:setup(opts)
-- end)
--
-- local cmp = require("cmp")
-- cmp.setup({
--     snippet = {
--         expand = function(args)
--             require('luasnip').lsp_expand(args.body)
--         end,
--     },
--     mapping = {
--       ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
--       ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
--       ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
--       ['<C-y>'] = cmp.mapping(cmp.mapping.confirm {behavior = cmp.ConfirmBehavior.Insert, select = true, }, { "i", "c" }),
--       ['<C-e>'] = cmp.mapping({
--         i = cmp.mapping.abort(),
--         c = cmp.mapping.close(),
--       }),
--       ['<CR>'] = cmp.mapping.confirm({ select = true }),
--     },
--     sources = cmp.config.sources({
--         { name = 'luasnip' },
--         { name = "buffer" },
--         { name = "nvim_lsp" },
--         { name = "path" }
--     }),
-- })
