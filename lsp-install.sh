#!/bin/sh

npm i -g vscode-langservers-extracted
yarn global add yaml-language-server
pip install "python-lsp-server[all]"
brew install hashicorp/tap/terraform-ls
npm install -g @ansible/ansible-language-server
