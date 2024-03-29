local buf_option = vim.api.nvim_buf_set_option
local buf_keymap = require 'lib.utils'.buf_keymap

vim.diagnostic.config {
  virtual_text = false,
  severity_sort = true,
  float = {
    source = true,
    focus = false,
    format = function(diagnostic)
      if diagnostic.user_data ~= nil and diagnostic.user_data.lsp.code ~= nil then
        return string.format("%s: %s", diagnostic.user_data.lsp.code, diagnostic.message)
      end
      return diagnostic.message
    end,
  }
}

local on_attach = function(_, bufnr)
  buf_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  buf_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',{ desc = 'go declaration'})
  buf_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',{ desc = 'go definition'})
  buf_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>',{ desc = 'hover'})
  buf_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',{ desc = 'go implementation'})
  buf_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',{ desc = 'signature help'})
  buf_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>',{ desc = 'type definition'})
  buf_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',{ desc = 'rename'})
  -- buf_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  buf_keymap(bufnr, 'n', 'gr', ':Telescope lsp_references<CR>',{ desc = 'lsp references'})

  -- buf_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  -- buf_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>')
  -- buf_keymap(bufnr, 'n', '<leader>ca', ':Telescope lsp_code_actions<CR>')
  -- buf_keymap(bufnr, 'v', '<leader>ca', ':Telescope lsp_range_code_actions<CR>')
  buf_keymap(bufnr, 'n', '<leader>ca', ':CodeActionMenu<CR>',{ desc = 'code action'})
  buf_keymap(bufnr, 'v', '<leader>ca', ':CodeActionMenu<CR>',{ desc = 'code action'})

  buf_keymap(bufnr, 'n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>',{ desc = 'diagnostic'})
  buf_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>',{ desc = 'diagnostic goto previous'})
  buf_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>',{ desc = 'diagnostic goto next'})
  -- buf_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
  -- buf_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
  -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
  buf_keymap(bufnr, 'n', '<leader>/', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>',{ desc = 'format'})
end

--
-- Language Servers
--
--
-- npm i -g vscode-langservers-extracted
require'lspconfig'.jsonls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    json = {
      schemas = require('schemastore').json.schemas()
    }
  }
}
require'lspconfig'.cssls.setup{
  on_attach = on_attach,
  flags = lsp_flags
}

require'lspconfig'.ansiblels.setup{
  on_attach = on_attach,
  flags = lsp_flags
}

-- yarn global add yaml-language-server
require('lspconfig')['yamlls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- require('lspconfig')[''].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }

require('lspconfig')['gopls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- require('lspconfig')['pyright'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }

-- pip install "python-lsp-server[all]"
require'lspconfig'.pylsp.setup{
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    pylsp = {
      plugins = {
        black = {
          enabled = true
        },
        mccabe = {
          enabled = false
        },
        pycodestyle = {
          enabled = false,
          ignore = {'W391'},
          maxLineLength = 100
        },
        pyflakes = {
          enabled = false
        },
        flake8 = {
          enabled = true,
          maxLineLength = 100
        }

      }
    }
  }
}

--  brew install hashicorp/tap/terraform-ls
require'lspconfig'.terraformls.setup{
  on_attach = on_attach,
  flags = lsp_flags,
}

--  npm install -g @ansible/ansible-language-server
require'lspconfig'.ansiblels.setup{
  on_attach = on_attach,
  flags = lsp_flags,
}

-- npm i -g vscode-langservers-extracted
require'lspconfig'.html.setup{
  on_attach = on_attach,
  flags = lsp_flags,
}
--
--
--

-- nvim-cmp supports additional completion capabilities
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _)
  if msg:match 'exit code' then
    return
  end
  if log_level == vim.log.levels.ERROR then
    vim.api.nvim_err_writeln(msg)
  else
    vim.api.nvim_echo({ { msg } }, true, {})
  end
end
