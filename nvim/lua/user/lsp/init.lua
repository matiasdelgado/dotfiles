local ok, _ = pcall(require, "vim.lsp.config")
if not ok then
  return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
