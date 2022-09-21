
require('lualine').setup {
  options = {
    component_separators = '',
    section_separators = '▕',
    theme = auto,
  },
  sections = {
    lualine_a = {
      'mode',
      { '"▏"', color = { fg = separator } },
    },
    lualine_b = {
      'branch',
      'diff',
      { '"▕"', color = { fg = separator } },
      '"力" .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
      { 'diagnostics', sources = { 'nvim_diagnostic' } },
      { '"▏"', color = { fg = separator } },
    },
    lualine_c = { 'filename' },
    lualine_x = {
      'filetype',
      'encoding',
      'fileformat',
    },
    lualine_y = {
      { '"▕"', color = { fg = separator } },
      '(vim.bo.expandtab and "␠ " or "⇥ ") .. " " .. vim.bo.shiftwidth',
      { '"▏"', color = { fg = separator } },
    },
    lualine_z = {
      'location',
      'progress',
    },
  },
  -- tabline = {
  --   lualine_a = {
  --     {'buffers'}
  --   },
  --   lualine_z = {
  --     {'tabs'}
  --   }
  -- }
}
