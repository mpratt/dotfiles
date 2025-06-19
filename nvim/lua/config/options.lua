-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- Encoding Stuff
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Appearance
vim.opt.errorbells = false
vim.opt.guifont = "Source Code Pro Medium:h10"
vim.opt.cmdheight = 2
vim.opt.background = "dark"
vim.opt.list = true
vim.opt.listchars = { nbsp = "¬", eol = "↳", tab = "└─", extends = "»", precedes = "«", trail = "•" }

-- Behavior
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showmatch = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.hlsearch = false
vim.opt.isfname:append("@-@")
vim.opt.shortmess:append("c")
vim.g.snacks_animate = false
