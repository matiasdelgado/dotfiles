-- A callback that will get called when a buffer connects to the language server.
-- Here we create any key maps that we want to have on that buffer.
-- local on_attach = function(_, bufnr)
--   local map_opts = { buffer = true, noremap = true }
--
--   -- remove the pipe operator
--   vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", map_opts)
--   -- add the pipe operator
--   vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", map_opts)
--   vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", map_opts)
-- end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("elixir").setup({
  capabilities = capabilities,
  -- on_attach = on_attach,
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      enableTestLenses = true,
      fetchDeps = false
    }
  }
})
