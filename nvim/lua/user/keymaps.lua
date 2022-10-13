local keymap = require 'lib.utils'.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap('n', '<leader>k', ':nohlsearch<CR>', {desc = 'clear search'})
keymap('n', '<leader>q', ':bdelete<CR>', {desc = 'buffer delete'})
keymap('n', '<leader>Q', ':bdelete<CR>', {desc = 'buffer delete'})

keymap('', 'gf', ':edit <cfile><CR>', {desc = 'go file'})

-- Reselect visual selection after indenting
keymap('v', '<', '<gv', {desc = 'less ident'})
keymap('v', '>', '>gv', {desc = 'more ident'})

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap('v', 'y', 'myy`hay', {desc = 'yank-without-jank'})
keymap('v', 'Y', 'myY`y', {desc = 'YANK-without-jank'})

keymap('n', '<leader><Left>', ':bprev<CR>', {desc = 'previous buffer'})
keymap('n', '<leader><Right>', ':bnext<CR>', {desc = 'next buffer'})

-- keymap('n', '<leader>/', ':Format<CR>')

keymap('n', '<leader>a', '<C-W><C-H>', {desc = 'left window'})
keymap('n', '<leader>d', '<C-W><C-L>', {desc = 'right window'})
keymap('n', '<leader>w', '<C-W><C-K>', {desc = 'upper window'})
keymap('n', '<leader>s', '<C-W><C-J>', {desc = 'down window'})
keymap('n', '<leader>.', '<C-W><C-W>', {desc = 'switch window'})


