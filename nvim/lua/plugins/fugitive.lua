return {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = {
        { "<leader>gc", "<cmd>Git commit<CR>", desc = "Git Commit (Fugitive)" },
        { "<leader>gg", "<cmd>Git<CR>", desc = "Git (Fugitive)" },
        { "<leader>gu", "<cmd>Git gui<CR>", desc = "Git gui (Fugitive)" },
    },
}
