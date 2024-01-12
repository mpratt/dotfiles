local opts = { remap = false }
vim.keymap.set("n", "<leader>gc", function() vim.cmd.Git({ 'commit' }) end, opts)
vim.keymap.set("n", "<leader>gg", function() vim.cmd.Git() end, opts)
vim.keymap.set("n", "<leader>gu", function() vim.cmd.Git({ 'gui' }) end, opts)
