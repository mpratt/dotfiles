return {
    'nvim-lualine/lualine.nvim',
    depends = {
        'kyazdani42/nvim-web-devicons'
    },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'horizon',
            },
            sections = {
                lualine_c = { { 'filename', path = 3 } },
            }
        })
    end
}
