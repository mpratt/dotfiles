vim.keymap.set({ "n", "x" }, "<leader>tsa", "<Plug>(operator-sandwich-add)", {
    desc = "Add surrounding character",
})

vim.keymap.set("n", "<leader>tsd",
    "<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)", {
    desc = "Delete surrounding character"
})

vim.keymap.set("n", "<leader>tsc",
    "<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)", {
    desc = "Change surrounding character"
})
