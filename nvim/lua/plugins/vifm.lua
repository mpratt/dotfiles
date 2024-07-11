return {
    'vifm/vifm.vim',
    config = function()
        vim.api.nvim_set_var('vifm_embed_term', 1)
        vim.api.nvim_set_var('vifm_embed_split', 1)
    end,
    keys = {
         {'<leader>4', '<cmd>leftabove vertical 60VsplitVifm<CR>'}
    },
    lazy = false
}
