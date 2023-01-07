require('mpratt.settings')
require('mpratt.mappings')
require('mpratt.plugins')
require('mpratt.lsp')

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
-- Highlight text when yanking
autocmd('TextYankPost', {
    group = augroup('HighlightYank', {}),
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

local customGroup = augroup('mprattGroup', {})
-- Remove trailing whitespace on save
autocmd({'BufWritePre'}, {
    group = customGroup ,
    command = '%s/\\s\\+$//e',
})

-- Change cwd to file we are currently editing
autocmd({"BufEnter"}, {
    group = customGroup ,
    command = 'silent! lcd %:p:h',
})

-- Save when focus is lost
autocmd({"FocusLost"}, {
    group = customGroup ,
    command = 'silent! wa',
})

-- Resize splits when the window is resized
autocmd({"VimResized"}, {
    group = customGroup ,
    command = ':wincmd =',
})

local cursorGroup = augroup('cursorLine', {})
-- Show cursorline in the current window and in normal mode
autocmd({ 'WinLeave', 'InsertEnter' }, {
    group = cursorGroup,
    callback = function()
        vim.opt.cursorline = false
    end,
})

autocmd({ 'WinEnter', 'InsertLeave' }, {
    group = cursorGroup,
    callback = function()
        vim.opt.cursorline = true
    end,
})

local trailingGroup = augroup('trailing', {})
-- Only show list chars when not in insert mode
autocmd({ 'InsertEnter'}, {
    group = trailingGroup,
    callback = function()
        vim.opt.list = false
    end,
})

autocmd({ 'InsertLeave' }, {
    group = trailingGroup,
    callback = function()
        vim.opt.list = true
    end,
})
