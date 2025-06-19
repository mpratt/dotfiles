-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local customGroup = augroup("mprattGroup", {})
local cursorGroup = augroup("cursorLine", {})
local trailingGroup = augroup("trailingChars", {})

-- Remove trailing whitespace on save
autocmd({ "BufWritePre" }, {
    group = customGroup,
    command = "%s/\\s\\+$//e",
})

-- Save when focus is lost
autocmd({ "FocusLost" }, {
    group = customGroup,
    command = "silent! wa",
})

-- Show cursorline in the current window and in normal mode
autocmd({ "WinLeave", "InsertEnter" }, {
    group = cursorGroup,
    callback = function()
        vim.opt.cursorline = false
    end,
})

autocmd({ "WinEnter", "InsertLeave" }, {
    group = cursorGroup,
    callback = function()
        vim.opt.cursorline = true
    end,
})

-- Only show list chars when not in insert mode
autocmd({ "InsertEnter" }, {
    group = trailingGroup,
    callback = function()
        vim.opt.list = false
    end,
})

autocmd({ "InsertLeave" }, {
    group = trailingGroup,
    callback = function()
        vim.opt.list = true
    end,
})
