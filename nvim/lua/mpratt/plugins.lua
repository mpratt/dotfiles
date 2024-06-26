local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
        requires = 'nvim-treesitter/nvim-treesitter',
    }

    use 'nvim-treesitter/nvim-treesitter-context';

    use 'gruvbox-community/gruvbox'
    use 'rose-pine/neovim'
    use 'github/copilot.vim'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use {
        "folke/which-key.nvim",
        config = function()
            -- vim.o.timeout = true
            -- vim.o.timeoutlen = 300
            require("which-key").setup {}
        end
    }

    use 'tpope/vim-fugitive'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'vifm/vifm.vim'
    use 'ap/vim-buftabline'
    use 'machakann/vim-sandwich'
    use 'numToStr/Comment.nvim'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'mbbill/undotree'
    use 'NvChad/nvim-colorizer.lua'

    use {
        'michaelrommel/nvim-silicon',
        cmd = 'Silicon',
        opt = true,
        config = function()
            require("silicon").setup({
                -- Configuration here, or leave empty to use defaults
                font = "Source Code Pro Medium=25"
            })
        end
    }

    use {
        "cbochs/grapple.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
            require("toggleterm").setup()
        end
    }

    use 'folke/trouble.nvim'
    use 'nvim-tree/nvim-web-devicons'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
