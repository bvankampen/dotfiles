
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

vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFileToggle<CR>', { silent = true, noremap = true })
