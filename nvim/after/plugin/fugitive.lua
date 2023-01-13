local opts = { remap = false}
vim.keymap.set("n", "<leader>gc", function() vim.cmd.Git({'commit'}) end, opts)
vim.keymap.set("n", "<leader>gg", function() vim.cmd.Git() end, opts)
vim.keymap.set("n", "<leader>gp", function() vim.cmd.Git({'push'}) end, opts)
vim.keymap.set("n", "<leader>gl", function() vim.cmd.Git({'pull',  '--rebase'}) end, opts)
