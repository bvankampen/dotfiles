-- vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_git_hl = 1
-- vim.g.nvim_tree_highlight_opened_files = 1
-- vim.g.nvim_tree_group_empty = 1

require('nvim-tree').setup {
  git = {
    ignore = false,
  },
  renderer = {
    indent_markers = {
      enable = true
    },
    highlight_opened_files = "icon",
    group_empty = true
  }
}

vim.cmd [[highlight NvimTreeIndentMarker guifg=#30323E]]

vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFileToggle<CR>', { silent = true, noremap = true })
