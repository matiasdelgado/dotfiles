require("conform").setup({
  formatters_by_ft = {
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
  },

  -- Optional: async format
  -- format_on_save = {
  --   timeout_ms = 3000,
  --   lsp_fallback = true, -- still uses tsserver if prettier isn't configured
  -- },
})
