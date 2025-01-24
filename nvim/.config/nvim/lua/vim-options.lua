vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>")

vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt

opt.relativenumber = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

vim.o.scrolloff = 8

-- Set default indentation settings
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.smarttab = true -- Enable smart indentation
vim.o.shiftwidth = 4 -- Default shift width for languages that use 4 spaces
vim.o.tabstop = 4 -- Number of spaces that a tab counts for
vim.o.softtabstop = 4 -- Soft tab stop, so that pressing backspace behaves as expected

vim.wo.number = true
vim.wo.cursorline = true

-- Language-specific indentation settings
vim.cmd([[
  augroup SetIndentation
    autocmd!

    " For Python, C, C++, and similar languages (4 spaces)
    autocmd FileType python,java,go setlocal shiftwidth=4 tabstop=4 softtabstop=4

    " For HTML, CSS, JavaScript, TypeScript (2 spaces)
    autocmd FileType html,css,javascript,typescript,lua,cpp,c setlocal shiftwidth=2 tabstop=2 softtabstop=2
  augroup END
]])



vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv")
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv")

vim.g.python3_host_prog = "~/.venvs/nvim/bin/python"
