local keymap = require 'lib.utils'.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


keymap('n', '<leader>sv', ':source ~/.config/nvim/new.lua<CR>')

keymap('n', '<leader>k', ':nohlsearch<CR>')
keymap('n', '<leader>d', ':bufdo bdelete<CR>')
