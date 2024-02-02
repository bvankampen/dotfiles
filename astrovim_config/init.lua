return {
  lsp = {
    formatting = {
      format_on_save = true, -- enable or disable automatic formatting on save
    },
  },
  mappings = {
    -- first key is the mode
    n = {
      ["<leader>ff"] = { 
        function() require("telescope.builtin").find_files { follow = true } end, 
        desc = "Find files", 
      },
      ["<leader>fF"] = {
        function() require("telescope.builtin").find_files { hidden = true, no_ignore = true, follow = true } end,
        desc = "Find all files",
      },
      ["<leader>fW"] = {
        function()
          require("telescope.builtin").live_grep {
            additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore", "-L" }) end,
          }
        end,
        desc = "Find words in all files",
      },

    },
  },
}
