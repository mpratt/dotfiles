local grapple = require("grapple")

vim.keymap.set("n", "<leader>hh", grapple.toggle, {
    desc = "List the stored grappling anchors in a popup",
})

vim.keymap.set("n", "<leader>ha", grapple.toggle_tags, {
    desc = "Add a grappling anchor",
})

vim.keymap.set("n", "<leader>h1", "<cmd>Grapple select index=1<cr>", {
    desc = "Grapple to file 1",
})
vim.keymap.set("n", "<leader>h2", "<cmd>Grapple select index=2<cr>", {
    desc = "Grapple to file 2",
})

vim.keymap.set("n", "<leader>h3", "<cmd>Grapple select index=3<cr>", {
    desc = "Grapple to file 3",
})

vim.keymap.set("n", "<leader>h4", "<cmd>Grapple select index=4<cr>", {
    desc = "Grapple to file 4",
})
