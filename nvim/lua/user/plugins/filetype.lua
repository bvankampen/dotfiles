vim.g.d_load_filetypes = 1

require('filetype').setup({
  overrides = {
    extensions = {
      html = "html"
    },
  }
})


vim.cmd([[
   autocmd Filetype markdown setlocal autoindent noexpandtab tabstop=4 shiftwidth=4
]])
