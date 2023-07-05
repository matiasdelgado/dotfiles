local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
  'elixirls',
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
})

lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp.setup()
