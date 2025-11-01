vim.filetype.add {
  extension = {
    jinja = "jinja",
    jinja2 = "jinja",
    j2 = "jinja",
    htmldjango = "jinja",
  },
}

return {
  "AstroNvim/astrolsp",
  ---@param opts AstroLSPOpts
  opts = function(_, opts)
    opts.servers = opts.servers or {}
    table.insert(opts.servers, "jinja_lsp")
    opts.config = require("astrocore").extend_tbl(opts.config or {}, {
      jinja_lsp = {
        filetypes = { "jinja", "html" },
        root_dir = require("lspconfig.util").root_pattern("*.toml", ".git"),
        -- settings = {
        hide_undefined = true,
        -- },
      },
    })
  end,
}
