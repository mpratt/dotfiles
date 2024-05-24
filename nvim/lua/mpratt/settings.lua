-- Encoding Stuff
vim.opt.encoding = 'utf-8'
--vim.opt.termencoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Appearance
vim.opt.termguicolors = true
vim.opt.errorbells = false
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.guifont='Source Code Pro Medium:h10'
vim.opt.cmdheight = 2
vim.opt.title = true
vim.opt.background = "dark"
vim.opt.list = true
vim.opt.listchars = { nbsp = '¬', eol = '↳', tab = '└─', extends = '»', precedes = '«', trail = '•'}

-- Behavior
vim.api.nvim_set_option("clipboard","unnamed")
vim.opt.foldenable = false
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.showmatch = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.shortmess:append("c")
