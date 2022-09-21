local keymap = require 'lib.utils'.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap('n', '<leader>k', ':nohlsearch<CR>')
keymap('n', '<leader>Q', ':bdelete<CR>')

keymap('', 'gf', ':edit <cfile><CR>')

-- Reselect visual selection after indenting
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap('v', 'y', 'myy`hay')
keymap('v', 'Y', 'myY`y')

keymap('n', '<leader><Left>', ':bprev<CR>')
keymap('n', '<leader><Right>', ':bnext<CR>')

keymap('n', '<leader>/', ':Format<CR>')

keymap('n', '<leader>a', '<C-W><C-H>')
keymap('n', '<leader>d', '<C-W><C-L>')
keymap('n', '<leader>w', '<C-W><C-K>')
keymap('n', '<leader>s', '<C-W><C-J>')
keymap('n', '<leader>.', '<C-W><C-W>')


