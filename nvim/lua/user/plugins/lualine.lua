-- local tabLineHl = vim.api.nvim_get_hl_by_name('TabLine', true)
-- local bg = '#' .. bit.tohex(tabLineHl.background, 6)
-- local fg = '#' .. bit.tohex(tabLineHl.foreground, 6)
local fg = '#F8F8F2' -- DraculaFg
local bg = '#21222C' -- DraculaBgDark
local separator = '#424450' -- DraculaSubtle
-- local fg = '#' .. bit.tohex(vim.api.nvim_get_hl_by_name('DraculaFg', true).foreground, 6)
-- local bg = '#' .. bit.tohex(vim.api.nvim_get_hl_by_name('DraculaBgDark', true).background, 6)
-- local separator = '#' .. bit.tohex(vim.api.nvim_get_hl_by_name('DraculaSubtle', true).foreground, 6)

require('lualine').setup {
  options = {
    component_separators = '',
    section_separators = '▕',
    theme = {
      normal = {
        a = { fg = fg, bg = bg },
        b = { fg = fg, bg = bg },
        c = { fg = fg, bg = bg },
        x = { fg = fg, bg = bg },
        y = { fg = fg, bg = bg },
        z = { fg = fg, bg = bg },
      },
      inactive = { c = { fg = fg, bg = bg } },
    },
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
