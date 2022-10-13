local telescope = require 'telescope'
local actions = require 'telescope.actions'
local keymap = require 'lib.utils'.keymap

telescope.setup {
  defaults = {
    path_display = { truncate = 1 },
    prompt_prefix = '  ',
    selection_caret = '  ',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-Down>'] = actions.cycle_history_next,
        ['<C-Up>'] = actions.cycle_history_prev,
      },
    },
    file_ignore_patterns = { '.git/' },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      previewer = false,
      layout_config = {
        width = 80,
      },
    },
    oldfiles = {
      prompt_title = 'History',
    },
    lsp_references = {
      previewer = false,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}

require('telescope').load_extension 'fzf'

keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], {desc = 'find files'})
keymap('n', '<leader>F', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]], {desc = 'find file (with .gitignore)'}) -- luacheck: no max line length
keymap('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], {desc = 'buffers'})
keymap('n', '<leader>r', [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]], {desc = 'live grep'})
keymap('n', '<leader>h', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], {desc = 'history'})
keymap('n', '<leader>t', [[<cmd>lua require('telescope.builtin').filetypes()<CR>]], {desc = 'filetypes'})

keymap('n', '<leader>zz', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], {desc = 'git status'})
keymap('n', '<leader>zc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], {desc = 'git commits'})
keymap('n', '<leader>zx', [[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]], {desc = 'git buffer commits'})
keymap('n', '<leader>zb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]], {desc = 'git branches'})
keymap('n', '<leader>zs', [[<cmd>lua require('telescope.builtin').git_stash()<CR>]], {desc = 'git stash'})
