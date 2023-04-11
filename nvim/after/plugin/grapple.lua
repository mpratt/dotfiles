local grapple = require("grapple")
local function nav_file(n)
    return function()
        grapple.select({ key = n })
    end
end

vim.keymap.set("n", "<leader>hh", grapple.popup_tags, {
    desc = "List the stored grappling anchors in a popup",
})

vim.keymap.set("n", "<leader>ha", grapple.tag, {
    desc = "Add a grappling anchor",
})

vim.keymap.set("n", "<leader>hd", grapple.untag, {
    desc = "Delete the current grappling anchor",
})

vim.keymap.set("n", "<leader>hq", grapple.quickfix, {
    desc = "List the stored grappling anchors in the quickfix window",
})

vim.keymap.set("n", "<leader>h1", nav_file(1), {
    desc = "Grapple to file 1",
})
vim.keymap.set("n", "<leader>h2", nav_file(2), {
    desc = "Grapple to file 2",
})
vim.keymap.set("n", "<leader>h3", nav_file(3), {
    desc = "Grapple to file 3",
})
vim.keymap.set("n", "<leader>h4", nav_file(4), {
    desc = "Grapple to file 4",
})
