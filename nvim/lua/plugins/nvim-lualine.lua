return {
    'nvim-lualine/lualine.nvim',
    depends = {
        'kyazdani42/nvim-web-devicons'
    },
    config = function()
        require('lualine').setup()
    end
}
