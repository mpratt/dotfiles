return {
    'machakann/vim-sandwich',
    opts = {},
    keys = {
        { '<leader>tsa', '<Plug>(operator-sandwich-add)', desc='Add surrounding character' },
        { '<leader>tsd', '<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)', desc='Delete surrounding character' },
        { '<leader>tsc', '<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)', desc='Change surrounding character' },
    },
}


