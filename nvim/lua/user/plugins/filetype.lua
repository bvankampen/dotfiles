vim.g.d_load_filetypes = 1

require('filetype').setup({
  overrides = {
    extensions = {
      html = "html",
      tf = "terraform",
      tfvars = "terraform",
      sls = "yaml"
    },
    literal = {
      ["python3.9"]  = "python"
    },
    complex = {
      [".*/ansible/.*%.yml"] = "yaml.ansible",
      [".*/roles/.*%.yml"] = "yaml.ansible",
    }
  }
})


vim.cmd([[
   autocmd Filetype markdown setlocal autoindent noexpandtab tabstop=4 shiftwidth=4
]])
