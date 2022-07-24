vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'

vim.o.number = true
vim.o.hidden = true

vim.o.signcolumn = 'yes:2'
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.spell = true
vim.o.title = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wildmode = 'longest:full,full'
vim.o.wrap = false
vim.o.list = true
vim.o.listchars = 'tab:▸ ,trail:·'
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.confirm = true
vim.o.backup = true
vim.o.backupdir = vim.fn.stdpath 'data' .. '/backup//'
vim.o.updatetime = 250          -- Decrease CursorHold delay
vim.o.redrawtime = 10000        -- Allow more time for loading syntax on large files
vim.o.showmode = false
vim.o.fillchars = 'eob: '

vim.cmd([[
  autocmd Filetype go setlocal autoindent noexpandtab tabstop=4 shiftwidth=4
  autocmd Filetype markdown setlocal autoindent noexpandtab tabstop=4 shiftwidth=4
]])
