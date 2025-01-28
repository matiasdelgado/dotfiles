local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

require'lspconfig'.elixirls.setup{
  cmd = { "/Users/matias.delgado/work/elixir-ls/release/language_server.sh" };
}
