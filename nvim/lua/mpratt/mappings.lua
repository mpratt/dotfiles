vim.g.mapleader = " "
local opts = { noremap = true }

-- Visual Mode Indenting
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<', '<gv', opts)

-- I hate when things don't auto-center
vim.keymap.set('n', 'G', 'Gzz', opts)
vim.keymap.set('n', '}', '}zz', opts)
vim.keymap.set('n', '{', '{zz', opts)
vim.keymap.set('n', ']]', ']]zz', opts)
vim.keymap.set('n', '[[', '[[zz', opts)
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)
vim.keymap.set('n', 'g;', 'g;zz', opts)
vim.keymap.set('n', 'g,', 'g,zz', opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Common Typos
vim.api.nvim_create_user_command('Wq', 'wq', {bang = true})
vim.api.nvim_create_user_command('WQ', 'wq', {bang = true})
vim.api.nvim_create_user_command('Wa', 'wa', {bang = true})
vim.api.nvim_create_user_command('WA', 'wa', {bang = true})
vim.api.nvim_create_user_command('Q', 'q', {bang = true})
vim.api.nvim_create_user_command('W', 'w', {bang = true})
vim.keymap.set('n', 'Q', '<nop>', opts)

-- H to move to the first non-blank char and L to move to the last non-blank char
vim.keymap.set('n', 'H', '^', opts)
vim.keymap.set('n', 'L', '$', opts)

-- Automatically jump to end of text you pasted - Paste multiple lines multiple times with simple ppppp
vim.keymap.set('v', 'y', 'y`]', opts)
vim.keymap.set({ 'v', 'n' }, 'p', 'p`]', opts)

-- This turns off Vim’s crazy default regex characters and makes searches use normal regexes
vim.keymap.set({ 'v', 'n' }, '/', '/\\v', opts)

-- Tab Navigation
vim.keymap.set('n', '<C-Tab>', '<cmd>bn<CR>', opts)
vim.keymap.set('n', '<C-S-Tab>', '<cmd>bp<CR>', opts)

-- Window Navigation
vim.keymap.set('n', '<A-Up>', '<cmd>wincmd k<CR>', opts)
vim.keymap.set('n', '<A-Down>', '<cmd>wincmd j<CR>', opts)
vim.keymap.set('n', '<A-Left>', '<cmd>wincmd h<CR>', opts)
vim.keymap.set('n', '<A-Right>', '<cmd>wincmd l<CR>', opts)
vim.keymap.set('n', '<A-d>', '<cmd>wincmd w<CR>', opts)

-- Visual Mode Replace
vim.keymap.set("v", "<C-r>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<C-r>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make <leader>w write and close the buffer, <leader>q just to close
vim.keymap.set('n', '<leader>w', '<cmd>w<CR><cmd>bd<CR>', opts)
vim.keymap.set('n', '<leader>q', '<cmd>bd<CR>', opts)

-- Reset all panels
vim.keymap.set('n', '<leader>o', '<cmd>only<CR>', opts)

-- Select entire buffer
vim.keymap.set('n', '<leader>b', 'ggVG$', opts)

-- Map U to redo (since u undo's)
vim.keymap.set('n', 'U', '<C-r>', opts)

-- Move lines up / down
vim.keymap.set('n', '<C-Up>', 'ddkP', opts)
vim.keymap.set('n', '<C-Down>', 'ddp', opts)

-- Yanking and pasting
vim.keymap.set('n', '<leader>y', '"+y', opts)
vim.keymap.set('v', '<leader>y', '"+y', opts)

vim.keymap.set('n', '<leader>p', '"+p', opts)
vim.keymap.set('v', '<leader>p', '"+p', opts)

vim.keymap.set('n', '<leader>d', '"_d', opts)
vim.keymap.set('v', '<leader>d', '"_d', opts)
