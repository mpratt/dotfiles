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

-- Highlight background line on errors/warnings
local diagnostic_lines_ns = vim.api.nvim_create_namespace("Diagnostic Lines")
local orig_signs_handler = vim.diagnostic.handlers.signs
local function severity_highlight(severity)
    if severity == vim.diagnostic.severity.ERROR then
        return 'DiffDelete'
    end

    return 'DiffText'
end

vim.diagnostic.handlers.signs = {
    show = function(_, bufnr, _, opts)
        -- Handle diagnostics for whole buffer for ns convenience
        local diagnostics = vim.diagnostic.get(bufnr)
        for _, diagnostic in ipairs(diagnostics) do
            vim.api.nvim_buf_set_extmark(
                diagnostic.bufnr,
                diagnostic_lines_ns,
                diagnostic.lnum, 0,
                { line_hl_group = severity_highlight(diagnostic.severity) }
            )
        end
        orig_signs_handler.show(diagnostic_lines_ns, bufnr, diagnostics, opts)
    end,
    hide = function(_, bufnr)
        vim.api.nvim_buf_clear_namespace(bufnr, diagnostic_lines_ns, 0, -1)
        orig_signs_handler.hide(diagnostic_lines_ns, bufnr)
    end,
}
