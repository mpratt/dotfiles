return {
    "https://git.sr.ht/~swaits/scratch.nvim",
    lazy = true,
    keys = {
        { "<leader>ss", "<cmd>Scratch<cr>", desc = "Scratch Buffer" },
    },
    cmd = {
        "Scratch",
        "ScratchSplit",
    },
    opts = {},
}
