set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

"lua <<EOF

"require('nvim-treesitter.configs').setup {
"  highlight = {
"    enable = true
"  },
"  indent = {
"    enable = true 
"  },
"  ensure_installed = {
"    "toml",
"    "json",
"    "go",
"    "bash",
"    "hcl",
"    "c",
"    "dockerfile",
"    "python",
"    "vim",
"    "yaml"
"  }
"}

"EOF
