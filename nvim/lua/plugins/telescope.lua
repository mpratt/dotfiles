return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({ defaults =  { path_display={ "smart" }} });
        local builtin = require('telescope.builtin')
        local project_files = function()
            local opts = {}
            vim.fn.system('git rev-parse --is-inside-work-tree')
            if vim.v.shell_error == 0 then
                builtin.git_files(opts)
            else
                builtin.find_files(opts)
            end
        end

        vim.keymap.set('n', '<C-p>', project_files)
        vim.keymap.set('n', '<C-f>', builtin.find_files)
        vim.keymap.set('n', '<C-h>', builtin.oldfiles)
        vim.keymap.set('n', '<C-g>', builtin.live_grep)
        vim.keymap.set('n', '<C-b>', builtin.buffers)
    end
}
