return {
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'rafamadriz/friendly-snippets'},
    {
        'L3MON4D3/LuaSnip',
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup({})
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'eslint',
                    'volar',
                    'ts_ls',
                    'cssls',
                    'html',
                    'intelephense',
                    'lua_ls',
                    'rust_analyzer',
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        require('lspconfig').lua_ls.setup({
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { 'vim' }
                                    }
                                }
                            }
                        })
                    end,
                    intelephense = function()
                        require('lspconfig').intelephense.setup({
                            init_options = {
                                globalStoragePath = os.getenv('HOME') .. '/.local/share/intelephense-st',
                            }
                        })
                    end,
                }
            })
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function()
            vim.diagnostic.config({
                virtual_text = true,
            })

            local lsp = require('lsp-zero')
            lsp.extend_lspconfig()

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({ buffer = bufnr, preserve_mappings = false })
                vim.keymap.set('n', '<leader>=', function() vim.lsp.buf.format() end, { buffer = bufnr })
            end)

            lsp.setup()
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    -- `Enter` key to confirm completion
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),

                    -- Ctrl+Space to trigger completion menu
                    ['<C-Space>'] = cmp.mapping.complete(),

                    -- Navigate between snippet placeholder
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

                    -- Scroll up and down in the completion documentation
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),

                    -- disable completion with tab
                    -- this helps with copilot setup
                    ['<Tab>'] = nil,
                    ['<S-Tab>'] = nil,
                })
            })
        end
    },
}
