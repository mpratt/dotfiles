-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Visual Mode Indenting
vim.keymap.set("v", ">", ">gv", { noremap = true, desc = "Indent right" })
vim.keymap.set("v", "<", "<gv", { noremap = true, desc = "Indent left" })

-- Map U to redo (since u undo's)
vim.keymap.set("n", "U", "<C-r>", { noremap = true, desc = "Redo" })

-- I hate when things don't auto-center
vim.keymap.set("n", "G", "Gzz", { noremap = true })
vim.keymap.set("n", "}", "}zz", { noremap = true })
vim.keymap.set("n", "{", "{zz", { noremap = true })
vim.keymap.set("n", "]]", "]]zz", { noremap = true })
vim.keymap.set("n", "[[", "[[zz", { noremap = true })
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })
vim.keymap.set("n", "g;", "g;zz", { noremap = true })
vim.keymap.set("n", "g,", "g,zz", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Common Typos
vim.api.nvim_create_user_command("Wq", "wq", { bang = true })
vim.api.nvim_create_user_command("WQ", "wq", { bang = true })
vim.api.nvim_create_user_command("Wa", "wa", { bang = true })
vim.api.nvim_create_user_command("WA", "wa", { bang = true })
vim.api.nvim_create_user_command("Q", "q", { bang = true })
vim.api.nvim_create_user_command("W", "w", { bang = true })
vim.keymap.set("n", "Q", "<nop>", { noremap = true })

-- Automatically jump to end of text you pasted - Paste multiple lines multiple times with simple ppppp
vim.keymap.set("v", "y", "y`]", { noremap = true })
vim.keymap.set({ "v", "n" }, "p", "p`]", { noremap = true })

-- Tab Navigation
vim.keymap.set("n", "<C-Tab>", "<cmd>bn<CR>", { noremap = true, desc = "Next buffer" })
vim.keymap.set("n", "<C-S-Tab>", "<cmd>bp<CR>", { noremap = true, desc = "Previous buffer" })

-- Move lines up / down
vim.keymap.set("n", "<C-Up>", "ddkP", { noremap = true, desc = "Move line up" })
vim.keymap.set("n", "<C-Down>", "ddp", { noremap = true, desc = "Move line down" })

-- Some buffer keymaps
vim.keymap.set("n", "<leader>bs", "gg0VG$", { noremap = true, desc = "Select the entire buffer" })
vim.keymap.set("n", "<leader>bw", function()
    vim.cmd("w")
    vim.cmd("bd")
end, { noremap = true, desc = "Save and delete buffer" })

vim.keymap.set("n", "<leader>b=", function()
    vim.lsp.buf.format({ async = true })
end, { noremap = true, desc = "Format Buffer" })
